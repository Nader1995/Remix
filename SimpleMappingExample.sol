//SPDX-License-Identifier: MIT

pragma solidity >=0.5.11 <  0.7.0;

contract SimpleMappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setValue (uint _index) public {

        myMapping[_index] = true;
    }

    function setMyAddressToTrue () public {

        myAddressMapping[msg.sender] = true;
    }
}
