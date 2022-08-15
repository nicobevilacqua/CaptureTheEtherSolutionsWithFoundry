// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface ICaptureTheEther {
    function setNickname(bytes32 nickname) external;

    function nicknameOf() external view returns (bytes32);
}
