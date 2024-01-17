// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import './ERC20.sol';
import './ERC20Burnable.sol';
import './Pausable.sol';
import './Blacklist.sol';
import './Ownable.sol';

contract BURSH is ERC20, ERC20Burnable, Pausable, Blacklist, Ownable {

    constructor() ERC20('BURSH', 'BUR') {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused whenNotBlacklisted {
        super._beforeTokenTransfer(from, to, amount);
    }

    function addToBlacklist(address _address) public onlyOwner {
        _addToBlacklist(_address);
    }

    function removeFromBlacklist(address _address) public onlyOwner {
        _removeFromBlacklist(_address);
    }
}
