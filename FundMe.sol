// Get funds from users
// Withraw funds
// Set a miinimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {
    function fund() public payable {
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value > 1e18, "Didn't send enough"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000

        // What is reverting?
        // undo any action before, and send remaininh gas back.
    }

    // function withraw() {}
}