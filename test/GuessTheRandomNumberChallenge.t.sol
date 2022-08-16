// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/IGuessTheRandomNumberChallenge.sol";

contract GuessTheRandomNumberChallengeTest is Test {
    using stdStorage for StdStorage;
    address private constant TARGET_ADDRESS = 0xCD1B2d5b72875e578b9cc45f1A59459e0D3715c3;
    IGuessTheRandomNumberChallenge private target;

    function setUp() public {
        target = IGuessTheRandomNumberChallenge(TARGET_ADDRESS);
    }

    function testGuessTheRandomNumberChallenge() public {
        uint8 answer = uint8(uint256(vm.load(TARGET_ADDRESS, 0)));
        console.log(answer);
        (bool success, ) = TARGET_ADDRESS.call{value: 1 ether}(
            abi.encodeWithSignature("guess(uint8)", answer)
        );
        assertTrue(success);
        assertTrue(target.isComplete());
    }

    receive() external payable {}
}
