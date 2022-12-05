pragma solidity ^0.6.12;

import "./Dai.sol";

contract DaiTest {
    Dai public dai;

    constructor() public {
        dai = new Dai();
    }

    // test that the initial values for name, symbol, and decimals are correct
    function testInitialValues() public {
        assert(dai.name() == "Dai Stablecoin", "Unexpected name");
        assert(dai.symbol() == "DAI", "Unexpected symbol");
        assert(dai.decimals() == 18, "Unexpected decimals");
    }

    // test that the totalSupply is initially 0
    function testTotalSupply() public {
        assert(dai.totalSupply() == 0, "Unexpected initial totalSupply");
    }

    // test that the balance of an account is initially 0
    function testBalance() public {
        assert(dai.balanceOf(address(this)) == 0, "Unexpected initial balance");
    }

    // test that the allowance of an account to spend another account's tokens is initially 0
    function testAllowance() public {
        assert(dai.allowance(address(this), address

    function testTransfer() public {
        // Mint some tokens to the contract's creator
        dai.mint(msg.sender, 1000);

        // Check that the creator's balance is 1000
        assert(dai.balanceOf(msg.sender) == 1000);

        // Transfer 500 tokens to another address
        dai.transfer(address(0), 500);

        // Check that the creator's balance is now 500
        assert(dai.balanceOf(msg.sender) == 500);
    }

    function testTransferFrom() public {
        // Mint some tokens to the contract's creator
        dai.mint(msg.sender, 1000);

        // Authorize another address to transfer tokens on behalf of the creator
        dai.approve(address(0), 500);

        // Transfer 500 tokens on behalf of the creator
        dai.transferFrom(msg.sender, address(0), 500);

        // Check that the creator's balance is now 500
        assert(dai.balanceOf(msg.sender) == 500);
    }

}
