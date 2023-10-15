// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {PoseidonExample} from "../src/PoseidonExample.sol";

contract TestPoseidonExample is Test {
    address internal _poseidon_t3;
    PoseidonExample internal _instance;

    function setUp() external virtual {
        _poseidon_t3 = makeAddr("Poseidon_T3");
        deployCodeTo("PoseidonT3.sol", _poseidon_t3);

        _instance = new PoseidonExample();
    }

    function testLocal() external view {
        console.logUint(_instance.doHash([uint256(1), 2]));
    }
}
