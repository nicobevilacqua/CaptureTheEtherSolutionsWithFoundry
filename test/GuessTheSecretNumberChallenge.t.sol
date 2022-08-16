// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/IGuessTheSecretNumberChallenge.sol";

contract GuessTheSecretNumberChallengeTest is Test {
    bytes32 private constant HASH =
        0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
    address private constant TARGET_ADDRESS = 0x244a98763e8749878E996F74777670c3a0a78d8c;
    IGuessTheSecretNumberChallenge private target;

    function setUp() public {
        target = IGuessTheSecretNumberChallenge(TARGET_ADDRESS);
    }

    function testGuessTheSecretNumberChallenge() public {
        uint8 answer = 0;
        while (true) {
            console.log(answer);
            if (keccak256(abi.encodePacked(answer)) == HASH) {
                console.log("found");
                console.log(answer);
                (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
                    abi.encodeWithSignature("guess(uint8)", answer)
                );
                assertTrue(success);
                assertTrue(target.isComplete());
                break;
            }
            answer++;
        }
    }

    receive() external payable {}
}
