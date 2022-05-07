//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Allowance  is Ownable {
    
    event AllowanceChanged(address indexed _forWho, 
                            address indexed _byWhom, 
                            uint _oldAmount, 
                            uint _newAmount);
    
    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }

    mapping(address => uint) public allowance;
    
    function setAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }

    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] += _amount;
    }

    function reduceAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] -= _amount;
    }


    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed!");
        _;
    }
}