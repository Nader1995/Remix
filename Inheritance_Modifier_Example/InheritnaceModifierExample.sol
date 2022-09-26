//SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "./Owned.sol";

contract InheritanceModifierExample is Owned{

    function creatNewToken() public onlyOwner{

        tokenBalance[owner] ++;
    }

    function burnToken() public onlyOwner{

        tokenBalance[owner] --;
    }

    function purchaseToken() public payable{

        require((tokenBalance[owner]*tokenPrice)/msg.value > 0, "not enough money");
        tokenBalance[owner]-=msg.value/tokenPrice;
        tokenBalance[msg.sender]+=msg.value/tokenPrice;
    }
    
    function sendToken (address _to, uint _amount) public {

        require(tokenBalance[msg.sender] >= _amount, "not enough token");
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        assert(tokenBalance[_to] + _amount >= tokenBalance[msg.sender]);
        
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}
