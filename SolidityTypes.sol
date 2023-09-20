// SPDX-License-Identifier: MIT
pragma solidity ^0.5.11;

contract SimpleStorage {
    // Basic Solidity Types
    // boolean, unit, int, address, bytes
    bool hasFavouriteNumber = true;
    uint256 FavouriteNumber = 7;
    int256 FavouriteInt = 7;
    address myAddress = 0x70355F405A6F6ccFBC8f129CBfA1D0Afa10293bf;
    bytes32 FavouriteBytes = "cat";
    string FavouriteString = "Seven";
}