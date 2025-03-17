// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Import OpenZeppelin Ownable contract
import "@openzeppelin/contracts/access/Ownable.sol";

// Inherit from Ownable contract 
contract Assignment9 is Ownable {
    // Create a public array called `deployedContracts` to store contract addresses in it 
    address[] public deployedContracts;

    // Call Ownable constructor of OpenZeppelin contract
constructor() Ownable(msg.sender) {}

    // @dev Factory to deploy new instances of `SimpleContract`
    // Only the owner can call this function
    function createContract(uint256 _initialValue) external onlyOwner {
        // Deploy new instance of SimpleContract
        SimpleContract newContract = new SimpleContract(_initialValue);
        
        // Push the new deployed instance to deployedContracts array
        deployedContracts.push(address(newContract));
    }
}

// Simple contract to be deployed by the factory
contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}