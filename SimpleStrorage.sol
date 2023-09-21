// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // This gets initialized to Zero
    // <- This means that this section is a comment!    
    // if we dont assign any value to this variable by default it will be assigned 0.

    // uint256 favouriteNumber;  // Visibility is Private now for our Number.
    uint256 public favouriteNumber; // Now Visibilit is Public for our Number.

    struct People {
        uint favouriteNumber;
        string name;
    }

    // Single Person
    People public person = People({favouriteNumber: 7, name: "Tarun"});

    // List of People type -> uint256[] public favouriteNumberLists
    People[] public people; // Dynamic Array because size is not given. ( People[3] -> Fixed Array Size is 3. )

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

    function addPerson(string memory _name, uint _favouriteNumber) public {
        People memory newPerson = People({favouriteNumber: _favouriteNumber, name: _name});
        // People memory newPerson = People(_favouriteNumber, _name); // Another way
        people.push(newPerson);
    }
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138 