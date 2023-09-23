// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // Storing in simpleStorage variable
        simpleStorageArray.push(simpleStorage); // Pushing single simpleStorage into simpleStorageArray 
    }
}