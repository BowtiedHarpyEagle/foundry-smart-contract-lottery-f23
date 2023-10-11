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
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle()  public payable {}

    function pickWinner() public {}

    /** Getter Function */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    } 
    
}