pragma solidity 0.6.0;

pragma experimental ABIEncoderV2;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceContract {
    
    AggregatorV3Interface internal priceFeed;
    address private priceAddress = 0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE; // BNB/USD Mainnet
    //address private priceAddress = 0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526; // BNB/USD Testnet
    //https://docs.chain.link/docs/bnb-chain-addresses/

    constructor(address payable ceoAddr,address payable proxyaccount) public {
        priceFeed = AggregatorV3Interface(priceAddress);
    }

    function getLatestPrice() public view returns (uint) {
        (,int price,,uint timeStamp,)= priceFeed.latestRoundData();
        // If the round is not complete yet, timestamp is 0
        require(timeStamp > 0, "Round not complete");
        return (uint)(price);
    }
}
