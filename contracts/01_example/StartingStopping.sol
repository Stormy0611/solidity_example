// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    
    address public owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getAddressSender() public view returns(address) {
        return msg.sender;
    }


    function sendMoney() public payable {
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, "You cannot withdraw.");
        require(paused == false, "Contract Paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}