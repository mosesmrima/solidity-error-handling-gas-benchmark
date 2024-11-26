//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Script.sol";
import {BareRequire} from "../src/BareRequire.sol";
import {CustomError} from "../src/CustomError.sol";
import {RequireWithMessage} from "../src/RequireWithMessage.sol";
import {CustomErrorWithRequire} from "../src/CustomErrorWithRequire.sol";
import {CustomErrorNoParams} from "../src/CustomErrorsWithNoParams.sol";

contract Benchmark is Test {
    BareRequire bareRequire;
    CustomError customError;
    RequireWithMessage requireWithMessage;
    CustomErrorWithRequire customErrorWithRequire;
    CustomErrorNoParams customErrorNoParams;

    function setUp() public {
        vm.startBroadcast();
        bareRequire = new BareRequire();
        customError = new CustomError();
        requireWithMessage = new RequireWithMessage();
        customErrorWithRequire = new CustomErrorWithRequire();
        customErrorNoParams = new CustomErrorNoParams();
        vm.stopBroadcast();
    }

    function contractSize(address contractAddress, string memory contractName) public view {
        uint256 codeSize;
        assembly {
            codeSize := extcodesize(contractAddress)
        }

        console.log("%s bytecode size %d", contractName, codeSize);
    }

    function testBenchmark() public {
        vm.expectRevert();
        bareRequire.benchmark();
        vm.expectRevert();
        customError.benchmark();
        vm.expectRevert();
        customErrorWithRequire.benchmark();
        vm.expectRevert();
        requireWithMessage.benchmark();
        vm.expectRevert();
        customErrorNoParams.benchmark();
    }

    function testBytecodeSize() public view {
        contractSize(address(bareRequire), "BareRequire");
        contractSize(address(customError), "CustomError");
        contractSize(address(customErrorWithRequire), "CustomErrorWithRequire");
        contractSize(address(requireWithMessage), "RequireWithMessage");
        contractSize(address(customErrorNoParams), "CustomErrorNoParams");
    }
}
