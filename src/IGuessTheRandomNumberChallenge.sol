// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGuessTheRandomNumberChallenge {
    function isComplete() external view returns (bool);

    function guess(uint8 n) external payable;
}
