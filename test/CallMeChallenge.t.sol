// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ICallMeChallenge.sol";

// forge test --fork-url https://ropsten.infura.io/v3/$INFURA_KEY --match-test testCallMeChallenge -vvvv

contract CallMeChallengeTest is Test {
    address private constant TARGET_ADDRESS = 0x9Cfa988DE88F33B77D789a28D442C8388c22150e;
    ICallMeChallenge private target;

    function setUp() public {
        target = ICallMeChallenge(TARGET_ADDRESS);
    }

    function testCallMeChallenge() public {
        target.callme();
        assertTrue(target.isComplete());
    }
}
