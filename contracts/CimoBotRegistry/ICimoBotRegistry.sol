// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface ISniperRegistry {

    /**
     * @dev Emitted when `_address` is flaged as Sniper
     * `_flag` === true, `_address` is added to Sniper list
     * `_flag` === false, `_address` is removed from Sniper list
     */
    event SniperUpdated(address _address, bool _flag);


    /**
     * @dev Emitted when `_address` is flaged as MEV bot
     * `_flag` === true, `_address` is added to MEV bots list
     * `_flag` === false, `_address` is removed from MEV bots list
     */
    event MEVUpdated(address _address, bool _flag);

    /**
     * @dev Returns true if the address is Sniper
     */
    function isSniper(address _address) external view returns (bool);

    /**
     * @dev Returns true if the address is MEV bot
     */
    function isMEV(address _address) external view returns (bool);

    /**
     * @dev Returns true if the address is either Sniper or MEV bot
     */
    function isBot(address _address) external view returns (bool);
}