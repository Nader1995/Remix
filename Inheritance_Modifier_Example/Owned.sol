//SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract Owned {

    address owner;

    modifier onlyOwner {

        require(msg.sender == owner, "You do not have permission");
        _;
    }

    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

        constructor() {

        owner = msg.sender;
        tokenBalance[owner] = 100;
    }

}
