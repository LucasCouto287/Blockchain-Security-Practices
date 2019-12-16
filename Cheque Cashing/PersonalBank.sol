pragma solidity ^0.5.0;

contract PersonalBank {
    address owner;
    mapping(bytes32 => bool) alreadySent;
    
    constructor() public payable {
        owner = msg.sender;
    }
    
    function() external payable {
    }
    
    function cashCheque(address payable to, uint256 amount, uint256 chequeNum,
                        bytes32 r, bytes32 s, uint8 v)
                public {
        bytes32 messageHash = keccak256(abi.encodePacked(to, amount, chequeNum, address(this)));
        
        bytes32 messageHash2 = keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message:\n32", messageHash
        ));
        require(alreadySent[messageHash] != true, "already sent");
        require(ecrecover(messageHash2, v, r, s) == owner, "bad signature");

        alreadySent[messageHash] = true;
        to.transfer(amount);
    }
}