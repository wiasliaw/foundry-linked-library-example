// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract ForkTest is Test {
    address private _poseidon;
    Example private _example;

    function setUp() external {
        // Fork can be `sepolia`, `arbitrum goerli`
        vm.createSelectFork("goerli");

        // deploy Example.sol
        _example = new Example();
    }

    function testLog() external {
        _example.insert(1);
    }
}
