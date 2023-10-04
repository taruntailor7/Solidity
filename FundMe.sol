// Get funds from users
// Withraw funds
// Set a miinimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

// For Custom Error
error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant minimumUsd = 50 * 1e18; // 1 * 10 ** 18

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        // What is reverting?
        // undo any action before, and send remaininh gas back.
    }

    function withraw() public onlyOwner {
        // for loop
        /* starting index, ending index, step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);
        // actually withraw the funds

        // 3 different ways to do this
        // 1 - transfer
        // payable(msg.sender).transfer(address(this).balance);
        // 2 - send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");
        // 3 - call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    // Modifier 
    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender is not owner!");
        // Custom Errors
        // if(msg.sender != i_owner) { revert NotOwner(); }
        _;
    }

    // What happend if someone sends this contract ETH without calling the fund function.
    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}