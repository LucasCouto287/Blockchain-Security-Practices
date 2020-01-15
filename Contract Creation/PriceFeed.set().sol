pragma solidity ^0.5.12;

contract PriceFeed {
    uint public price = 42;
    function getPrice() external view returns (uint){
        return price;
    }
    function setPrice(uint amount) payable external{
        require(msg.value >= 1, 'upper than 1');
        price=amount;
    }
}

contract Consumer {
    function getPrice(PriceFeed feed)public view returns(uint){
        return feed.getPrice.value(msg.value)();
    }
    function setPrice(PriceFeed feed, uint amount) payable public{
        feed.setPrice.Value(msg.value)(amount);
    }
}
