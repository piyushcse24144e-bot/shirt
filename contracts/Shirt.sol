// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Shirt {
    address public owner;
    uint256 public price;
    uint256 public totalSales;

    constructor(uint256 _price) {
        owner = msg.sender;
        price = _price;
    }

    // Function 1: Purchase a shirt
    function buyShirt() external payable {
        require(msg.value == price, "Incorrect payment amount");
        totalSales += 1;
    }

    // Function 2: Withdraw funds (only owner)
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    // Function 3: View contract balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

