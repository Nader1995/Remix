//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract MappingStructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balanceReceived;

    function getBalance () public view returns (uint){

        return address(this).balance;
    }

    function sendMoney () public payable{   

        balanceReceived[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value, block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments]=payment;
        balanceReceived[msg.sender].numPayments++;
    }

    function viewPaymentOfSender (uint _numPayments) public view returns (uint) {

        return balanceReceived[msg.sender].payments[_numPayments].amount;
    }

    function withDrawAllMoney (address payable _to) public {

        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }

    function withDrawMoney (address payable _to, uint _amount) public {

        require(balanceReceived[msg.sender].totalBalance >= _amount, "Get outta here poor shit!");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
}
