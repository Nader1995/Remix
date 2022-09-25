// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract MyVariables {

/*
    uint256 public myUint;

    function setMyUint (uint _myUint) public{

        myUint = _myUint;
    }

    bool public myBool;

    function setMyBool (bool _myBool) public {

        myBool = _myBool;
    }

    uint8 public myUint8;
    
    function increase () public {

        myUint8 ++;
    }

    function decrease () public {

        myUint8 --;
    }

*/

    address public myAddress;

    function setMyAddress (address _myAddress) public {

        myAddress = _myAddress;
    }

    function getBalance () public view returns (uint){

        return myAddress.balance;
    }
}
