//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {console} from "forge-std/Script.sol";
contract CustomErrorNoParams {
    error InsufficientBalance();

    uint256 public constant BALANCE = 1 ether;

    function transfer(uint256 amount) public pure {
        if (BALANCE < amount) {
            revert InsufficientBalance();
        }
    }

    function benchmark() public pure {
        transfer(2 ether);
    }
}
