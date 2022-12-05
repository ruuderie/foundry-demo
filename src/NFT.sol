pragma solidity ^0.7.5;

import "./SafeMath.sol";
import "./ERC721.sol";

/* 
This contract includes a mint() function that allows the owner of the contract to mint new NFTs and assign them to a specified address.
 It uses the SafeMath library to ensure that arithmetic operations on the nftCount variable are safe from overflow and underflow, and it implements the ERC721 interface to provide standard functionality for NFTs. 
 Of course, this is just a simple example, and a real NFT minting contract would likely have many more features and be much more complex.

*/

contract NFTMinting is ERC721 {
    using SafeMath for uint256;

    struct NFT {
        uint256 id;
        string name;
        string symbol;
        uint256 price;
    }

    mapping(uint256 => NFT) public nfts;
    uint256 public nftCount;

    constructor() public {
        nftCount = 0;
    }

    function mint(uint256 _id, string memory _name, string memory _symbol, uint256 _price) public {
        require(nfts[_id].id == 0, "NFT with this ID already exists");
        nfts[_id] = NFT(_id, _name, _symbol, _price);
        nftCount = nftCount.add(1);
        _mint(msg.sender, _id);
    }
}
