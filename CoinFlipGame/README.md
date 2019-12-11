# Exercise: Coin Flip Game

## Deploy the CoinFlipGame contract below.


##### pragma solidity ^0.5.0;

contract CoinFlipGame {
    constructor() public payable {
    }
    
    event LogWin(uint256 amount);
    event LogLose(uint256 amount);
    
    function bet() public payable {
        require(msg.value <= maxBet(), "bet size too big");
        
        if (generateRandomBit()) {
            emit LogWin(msg.value);
            msg.sender.transfer(msg.value * 2);
        } else {
            emit LogLose(msg.value);
        }
    }
    
    function maxBet() public view returns(uint256) {
        return address(this).balance / 10;
    }
    
    function generateRandomBit() private view returns(bool) {
        bytes32 hash = keccak256(
                        abi.encodePacked(
                            msg.sender,
                            msg.value,
                            block.number,
                            block.timestamp,
                            gasleft()
                        )
                    );
                    
        return uint256(hash) % 2 == 0;
    }
}



#### Make sure to send an initial value of ETH in when you deploy it. Try to make a few bets and see if you win or lose.

#### The generateRandomBit() function uses several of the solidity special variables, and combines them with the hash function keccak256().


#### Note: The remix IDE doesn't implement blockhash() properly. If you choose to use this function, test on a ganache instance
