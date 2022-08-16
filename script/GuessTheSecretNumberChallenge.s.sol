// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/IGuessTheSecretNumberChallenge.sol";

contract GuessTheNumberChallengeScript is Script {
    address private constant TARGET_ADDRESS = 0x244a98763e8749878E996F74777670c3a0a78d8c;
    uint8 private constant ANSWER = 170;
    IGuessTheSecretNumberChallenge private target;

    function setUp() public {
        target = IGuessTheSecretNumberChallenge(TARGET_ADDRESS);
    }

    function run() public {
        vm.startBroadcast();
        (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
            abi.encodeWithSignature("guess(uint8)", ANSWER)
        );
        require(success, "Call:failed");
        require(target.isComplete(), "Challenge:incomplete");
        vm.stopBroadcast();
    }
}
