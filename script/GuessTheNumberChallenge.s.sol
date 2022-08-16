// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/IGuessTheNumberChallenge.sol";

contract GuessTheNumberChallengeScript is Script {
    address private constant TARGET_ADDRESS = 0x568dEd6B6eA2c11cFe2B8742790Eaac785e155Da;
    uint8 private constant ANSWER = 42;
    IGuessTheNumberChallenge private target;

    function setUp() public {
        target = IGuessTheNumberChallenge(TARGET_ADDRESS);
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
