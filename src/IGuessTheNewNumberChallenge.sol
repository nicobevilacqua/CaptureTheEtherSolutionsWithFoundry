// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGuessTheNewNumberChallenge {
    function isComplete() external view returns (bool);

    function guess(uint8) external payable;
}
