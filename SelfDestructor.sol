// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfDestructor {

  address payable public target;

  constructor(address payable _target) {
    target = _target;
  }

  function ownTarget() public {
    selfdestruct(target);
  }

  receive() external payable { }

}
