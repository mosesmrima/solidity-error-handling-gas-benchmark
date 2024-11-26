//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {console} from "forge-std/Script.sol";

contract CustomErrorWithRequire {
    error InsufficientBalance(uint256 available, uint256 required);

    uint256 public constant BALANCE = 1 ether;

    function transfer(uint256 amount) public pure {
        require(BALANCE >= amount, InsufficientBalance(BALANCE, amount));
    }

    function benchmark() public pure {
        transfer(2 ether);
    }
}
