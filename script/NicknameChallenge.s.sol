// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/INicknameChallenge.sol";
import "../src/ICaptureTheEther.sol";

contract NicknameChallengeScript is Script {
    address private constant TARGET_ADDRESS = 0x045c6C194530AD9E5Bc2e87307089FbF80F04B2b;
    address private constant CAPTURE_THE_ETHER_ADDRESS = 0x71c46Ed333C35e4E6c62D32dc7C8F00D125b4fee;

    INicknameChallenge private target;
    ICaptureTheEther private capture;

    function setUp() public {
        target = INicknameChallenge(TARGET_ADDRESS);
        capture = ICaptureTheEther(CAPTURE_THE_ETHER_ADDRESS);
    }

    function run() public {
        vm.startBroadcast();
        bytes32 nickname = bytes32(bytes("PeronPeronFoundry"));
        capture.setNickname(nickname);
        vm.stopBroadcast();
    }
}
