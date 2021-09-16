// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./ERC20.sol";
import "./extentions/ERC20Burnable.sol";
import "./security/Pausable.sol";
import "./access/Ownable.sol";

contract Wave is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("Wave", "wav") {
        _mint(msg.sender, 100 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
