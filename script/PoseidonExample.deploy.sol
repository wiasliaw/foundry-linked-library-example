// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {PoseidonExample} from "../src/PoseidonExample.sol";

contract DeployPoseidonExample is Script {
    function run() external {
        (address deployer, uint256 privkey) = makeAddrAndKey("DEPLOYER");
        vm.createSelectFork("goerli");
        vm.startBroadcast(privkey);
        PoseidonExample _instance = new PoseidonExample();
        vm.stopBroadcast();

        console.logAddress(address(_instance));
    }
}
