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
