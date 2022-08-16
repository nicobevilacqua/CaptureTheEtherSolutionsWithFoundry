// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ICallMeChallenge.sol";

contract CallMeChallengeScript is Script {
    address private constant TARGET_ADDRESS = 0x9Cfa988DE88F33B77D789a28D442C8388c22150e;
    ICallMeChallenge private target;

    function setUp() public {
        target = ICallMeChallenge(TARGET_ADDRESS);
    }

    function run() public {
        vm.startBroadcast();
        target.callme();
        vm.stopBroadcast();
    }
}
