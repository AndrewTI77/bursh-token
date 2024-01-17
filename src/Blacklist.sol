// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Context.sol";

abstract contract Blacklist is Context {
  
    event Blacklisted(address account);

    event Unblacklisted(address account);

    mapping(address => bool) blacklistedAccouts;

    constructor() {
    }

    modifier whenNotBlacklisted() {
        _requireNotBlacklisted(_msgSender());
        _;
    }

    function isBlacklisted(address _address) public view virtual returns (bool) {
        return blacklistedAccouts[_address];
    }

    function _requireNotBlacklisted(address _address) internal view virtual {
        require(!isBlacklisted(_address), "Blacklist: address in the blacklist");
    }

    function _addToBlacklist(address _address) internal virtual {
        blacklistedAccouts[_address] = true;
        emit Blacklisted(_address);
    }

    function _removeFromBlacklist(address _address) internal virtual {
        blacklistedAccouts[_address] = false;
        emit Unblacklisted(_address);
    }
}
