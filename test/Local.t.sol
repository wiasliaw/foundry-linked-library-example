// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract LocalTest is Test {
    using stdJson for string;

    address private _poseidon;
    Example private _example;

    function setUp() external {
        // deploy PoseidonT3.sol with specified address
        _poseidon = address(0xeeeeeeee);
        deployCodeTo("PoseidonT3.sol:PoseidonT3", _poseidon);

        // deploy Example.sol
        _example = new Example();
    }

    function testLog() external {
        _example.insert(1);
    }
}
