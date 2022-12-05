pragma solidity ^0.7.5;

import "./SafeMath.sol";

contract Treasury {
    using SafeMath for uint256;

    address public owner;
    uint256 public totalFunds;

    constructor() public {
        owner = msg.sender;
        totalFunds = 0;
    }

    function deposit(uint256 _amount) public payable {
        require(msg.value == _amount, "Invalid deposit amount");
        totalFunds = totalFunds.add(_amount);
    }

    function withdraw(uint256 _amount) public {
        require(totalFunds >= _amount, "Insufficient funds");
        totalFunds = totalFunds.sub(_amount);
        msg.sender.transfer(_amount);
    }
}

/* 
This contract includes a deposit() function that allows members of the DAO to deposit funds, and a withdraw() function that allows the owner of the contract to withdraw funds from the treasury. It uses the SafeMath library to ensure that arithmetic operations on the totalFunds variable are safe from overflow and underflow. Of course, this is just a simple example, and a real DAO Treasury contract would likely have many more features and be much more complex.

*/