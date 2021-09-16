// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./ERC721.sol";
import "./extensions/ERC721URIStorage.sol";
import "./access/Ownable.sol";
import "./utils/Counters.sol";

contract Collectible is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Collectible", "col") {}

    function safeMint(address to, string memory _tokenURI) public onlyOwner {
        _safeMint(to, _tokenIdCounter.current());
        super._setTokenURI(_tokenIdCounter.current(),_tokenURI);
        _tokenIdCounter.increment();
        
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
