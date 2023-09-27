// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SafeMathTester {
    uint8 public bigNumber = 255; // Checked // maximum number is 255 for uint8

    function add() public {
        unchecked {bigNumber = bigNumber + 1;} // from unchecked it will be 0 again if we try to add in uint8 bigNumber because we have maximum is 255 and after it became 0 then we can add.
        // if we remove unchecked it nothing will happen number will be 255 only after adding also
    }
}