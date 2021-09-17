// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./ERC1155.sol";
import "./access/Ownable.sol";

contract My1155 is ERC1155, Ownable {
    constructor() ERC1155("") {
        _mint(msg.sender, 1, 10**18, "");
        _mint(msg.sender, 2, 10**27, "");
        _mint(msg.sender, 3, 1, "");
        _mint(msg.sender, 5, 10**9, "");
        _mint(msg.sender, 6, 10**9, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
