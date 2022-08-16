// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/INicknameChallenge.sol";
import "../src/ICaptureTheEther.sol";

contract NicknameChallengeTest is Test {
    address private constant TARGET_ADDRESS = 0x045c6C194530AD9E5Bc2e87307089FbF80F04B2b;
    address private constant USER_ADDRESS = 0x23e1b1a0048988f702c1bE31b69fC52e0c253C79;
    address private constant CAPTURE_THE_ETHER_ADDRESS = 0x71c46Ed333C35e4E6c62D32dc7C8F00D125b4fee;

    INicknameChallenge private target;
    ICaptureTheEther private capture;

    function setUp() public {
        vm.startPrank(USER_ADDRESS);
        target = INicknameChallenge(TARGET_ADDRESS);
        capture = ICaptureTheEther(CAPTURE_THE_ETHER_ADDRESS);
    }

    function testNicknameChallenge() public {
        bytes32 nickname = bytes32(bytes("PeronPeronFoundry"));
        capture.setNickname(nickname);
        assertTrue(target.isComplete());
    }
}
