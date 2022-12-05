pragma solidity ^0.8.0;

contract Insurance {
address payable public owner;
uint256 public premium;
uint256 public payout;
address public tokenAddress;
uint256 public tokenValue;
constructor() public {
    owner = msg.sender;
    premium = 0;
    payout = 0;
    tokenAddress = address(0);
    tokenValue = 0;
}

function setPremium(uint256 _premium) public {
    require(msg.sender == owner);
    premium = _premium;
}

function setPayout(uint256 _payout) public {
    require(msg.sender == owner);
    payout = _payout;
}

function setToken(address _tokenAddress, uint256 _tokenValue) public {
    require(msg.sender == owner);
    tokenAddress = _tokenAddress;
    tokenValue = _tokenValue;
}

function claim() public payable {
    require(msg.value == premium);
    require(tokenAddress != address(0));

    ERC20 token = ERC20(tokenAddress);
    token.transfer(msg.sender, tokenValue);
}
}