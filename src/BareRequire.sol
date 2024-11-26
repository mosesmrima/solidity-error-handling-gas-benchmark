//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BareRequire {
    uint256 constant public BALANCE = 1 ether;

    function transfer(uint256 amount) public  pure {
        require(BALANCE >= amount);
    }

    function benchmark() public  pure {
        transfer(2 ether);
    }
}
