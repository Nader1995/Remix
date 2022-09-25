// SPDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract FuctionsExample{

    mapping(address => uint) public balanceReceived;

    function receivedMoney () public payable {

        assert(balanceReceived[msg.sender]+msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withDrawMoney (address payable _to, uint _amount) public {

        require(_amount <= balanceReceived[msg.sender], "Not enough funds");
        assert(balanceReceived[msg.sender]-_amount <= balanceReceived[msg.sender]);

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
