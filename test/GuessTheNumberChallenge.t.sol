// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/IGuessTheNumberChallenge.sol";

contract GuessTheNumberChallengeTest is Test {
    address private constant TARGET_ADDRESS = 0x568dEd6B6eA2c11cFe2B8742790Eaac785e155Da;
    IGuessTheNumberChallenge private target;

    function setUp() public {
        target = IGuessTheNumberChallenge(TARGET_ADDRESS);
    }

    function testGuessTheNumberChallenge() public {
        (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
            abi.encodeWithSignature("guess(uint8)", 42)
        );
        assertTrue(success);
        assertTrue(target.isComplete());
    }

    receive() external payable {}
}
