//SPDX-License-Idenfitier: MIT

pragma solidity 0.8.4;

contract WillThrow {
    
    function aFunction() public {
        // require(false, "Error message");
        assert(false);
    }
}

contract ErrorHandling {

    event ErrorLogging(string reason);
    
    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
        //here we could do something if it works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}