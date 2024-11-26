//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RequireWithMessage {
    uint256 public BALANCE = 1 ether;

    function transfer(uint256 amount) public view {
        require(BALANCE >= amount, "Insufficient balance");
    }

    function benchmark() public view {
        transfer(2 ether);
    }
}
