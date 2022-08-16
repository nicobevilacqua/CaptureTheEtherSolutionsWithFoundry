// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGuessTheNumberChallenge {
    function answer() external view returns (uint8);

    function isComplete() external view returns (bool);

    function guess(uint8) external payable;
}
