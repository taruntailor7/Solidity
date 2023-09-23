// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// Inheritance by doing -> is SimpleStorage
contract ExtraStorage is SimpleStorage {
    // + 5
    // override
    // virtual override // need to add virtual keyword in Store function inside SimpleStorage Contract.
    // Overriding Store 
    function Store(uint256 _favouriteNumber) public override {
        favouriteNumber = _favouriteNumber + 5;
    }
}