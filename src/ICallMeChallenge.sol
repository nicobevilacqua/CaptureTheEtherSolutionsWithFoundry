// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface ICallMeChallenge {
    function isComplete() external view returns (bool);

    function callme() external;
}
