// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank bank;
    function setUp () public {
        bank = new Bank ();
        vm.deal(address(this), 5 ether);
    }
    // adding receive and fallback
    receive () external payable {}
    fallback () external payable {}
    
    function testDeposit () public {
        bank.deposit{value: 1 ether}();
        assertEq(bank.getBalance(),1 ether);
    }
    function testWithdraw () public {
        vm.deal(address(this), 5 ether);
        bank.deposit{value: 2 ether}();
        bank.withdraw(1 ether);
        assertEq(bank.getBalance(),1 ether);
    }
}