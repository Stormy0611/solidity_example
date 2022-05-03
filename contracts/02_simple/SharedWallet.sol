//SPDX-License-Identifier: MIT

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

pragma solidity ^0.8.1;

contract SharedWallet is Ownable {

    address owner;
    
    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public isOwner {
        allowance[_who] == _amount;
    }
    
    modifier ownerOrAllowed(uint _amount) {
        
    }

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    
    }
    
    receive() external payable {
    }
}