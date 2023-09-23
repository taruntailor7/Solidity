// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    // Creating another contract from this contract.
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // Storing in simpleStorage variable
        simpleStorageArray.push(simpleStorage); // Pushing single simpleStorage into simpleStorageArray 
    }

    // Interacting with other contract.
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // For interacting with other contract we need below two things.
        // Address
        // ABI - Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.Store(_simpleStorageNumber);
    }

    // Will get or read the stored value from this contratc stored by this contract by calling Store funtion.
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}