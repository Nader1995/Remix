//SPDX-License-Identifier: MIT

pragma solidity >=0.5.11 <  0.7.0;

contract StartStopUpdateExample {

    address owner;
    bool public paused;

    constructor() public {

        owner = msg.sender;
    }

    function setPause (bool _paused) public {

        require(msg.sender == owner, "You do not havce permission!");
        paused = _paused;
    }

    function sendMoney() payable public {

    }

    function withDrawAllMoney (address payable _to) public {

        require(msg.sender == owner, "Get the hell outta here!");
        require(paused == false, "Transaction is paused!");
        _to.transfer(address(this).balance);
    }

    function destroyContract (address payable _to) public{

        require(msg.sender==owner, "Dude,come on!!");
        selfdestruct(_to);
    }
}
