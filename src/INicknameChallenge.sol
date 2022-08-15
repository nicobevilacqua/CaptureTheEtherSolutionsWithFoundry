// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface INicknameChallenge {
    function player() external view returns (address);

    function NicknameChallenge(address) external;

    function isComplete() external view returns (bool);
}
