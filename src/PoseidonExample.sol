// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {PoseidonT3} from "poseidon-solidity/PoseidonT3.sol";

contract PoseidonExample {
    function doHash(uint256[2] calldata arr) external pure returns (uint256) {
        return PoseidonT3.hash(arr);
    }
}
