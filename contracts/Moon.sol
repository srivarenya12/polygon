// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract Moon is ERC721A {
    address public owner;

    uint256 public max = 5;

    string baseUrl =
        "https://white-recent-porpoise-959.mypinata.cloud/ipfs/QmbTtcH3tGKDwPAi2F2piZvELCjYf8FrjxGaCQnGTwt6Wq/";

    string public prompt = "Animals on the moon";

    constructor() ERC721A("Moon", "MA") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= max,
            "5 is maximum that you can mint"
        );
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}