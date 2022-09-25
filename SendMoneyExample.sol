//SPDX-License-Identifier: MIT

pragma solidity >= 0.5.11 < 0.7.0;

contract SendMoneyExample {

    uint public balanceReceived;

    function recieveMoney () public payable {

        balanceReceived += msg.value;
    }

    function getBalance () public view returns (uint){

        return address(this).balance;
    }

    function withDrawMoney() public {

        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }

    function withDrawMoneyTo(address payable _to) public {

        _to.transfer(this.getBalance());
    }
 }
