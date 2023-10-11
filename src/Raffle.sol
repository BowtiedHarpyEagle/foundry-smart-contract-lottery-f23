// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title sample Raffle contract
 * @author BowtiedHarpyEagle
 * @notice this is a sample contract of a raffle based on Patrick Collins' tutorial 
 * on YouTube (https://www.youtube.com/watch?v=gecEjRVNt34&list=PL2-Nvp2Kn0FPH2xU3IbKrrkae-VVXs1vk&index=107)
 * @dev implements Chainlink VRFv2 
 */

contract Raffle {
    error Raffle__NotEnoughETHSent();
    uint256 private immutable i_entranceFee;
    // @dev duration of the raffle in seconds
    uint256 private immutable i_interval;
    address payable [] private s_players;
    uint256 private s_lastTimestamp;

    /** Events */

    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimestamp = block.timestamp;
    }

    function enterRaffle()  external payable {
        /**  require(msg.value >= i_entranceFee, "Not enough ETH sent!"); 
        *Don't use require, custom error is more gas efficient 
        */
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHSent();
        }
        s_players.push(payable(msg.sender));
        /** Events are important to 
         * 1. let the front-end know that something happened
         * 2. make migrations easier
         */
        emit EnteredRaffle(msg.sender);
    }
    /*  1. Get a random number
        2. Use that number to pick a winner
        3. Get called automatically */
    
    function pickWinner() external {
        //check if enough time has passed
        if (block.timestamp - s_lastTimestamp < i_interval) {
            revert ();
        } 
    }

    /** Getter Function */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    } 

}