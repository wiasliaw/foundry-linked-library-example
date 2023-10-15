// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {PoseidonExample} from "../src/PoseidonExample.sol";

contract ForkPoseidonExample is Test {
    PoseidonExample internal _instance;
    uint256 forkID;

    function setUp() external {
        forkID = vm.createFork("goerli");
        _instance = new PoseidonExample();
    }

    function testFork() external {
        console.logUint(_instance.doHash([uint256(1), 2]));
    }
}
