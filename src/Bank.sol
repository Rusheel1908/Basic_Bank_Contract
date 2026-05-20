// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract Bank {
    mapping(address => uint256) public balances;

    // to add eth to contract
    function deposit() public payable {
        require(msg.value > 0, "Send ETH");
        balances[msg.sender] += msg.value;
    }

    // to transfer  eth from contract
    function withdraw(uint256 amount) public payable {
        require(balances[msg.sender] >= amount, "Insuficient ETH");
        balances[msg.sender] -= amount;
        (bool success,) = payable(msg.sender).call{value: amount}("");
        require(success, "transfer failed");
    }

    // to check balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
