// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;     // EVM- Istanbul

contract Moneybox{          //Contract 0x8e0fE565D15Fec6b86F5d429b70936FFfC47bc70
    uint256 public balance;
    address private owner;

    receive() external payable{
        balance+= msg.value;
    }

    constructor(){
        owner = msg.sender;
    }

    function withdraw(uint amount,address payable destinationAddress) public {
        require(msg.sender== owner,"Cant't withdraw, you are not an owner");
        require(amount <= balance,"Cant't withdraw, not enough money");
        
        destinationAddress.transfer(amount);
        balance-= amount;
    }
}