// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // This gets initialized to Zero
    // <- This means that this section is a comment!
    // if we dont assign any value to this variable by default it will be assigned 0.

    // uint256 favouriteNumber;  // Visibility is Private now for our Number.
    uint256 public favouriteNumber; // Now Visibilit is Public for our Number.

    function Store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    // view function
    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    // pure function
    function add() public pure returns(uint256){
        return (1 + 1);
    }
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138 