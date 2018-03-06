pragma solidity ^0.4.17;

import './BidStadium.sol';

contract Auction {
    BidStadium public bidstadium; // the parent contract

    address public beneficiary; // The bid creator

    uint public auctionEnd;


    function Auction (address _bidstadium, address _beneficiary, uint _biddingTime) public {
        bidstadium = BidStadium(_bidstadium); // reference the BidStadium address for fee charging

        beneficiary = _beneficiary;

        auctionEnd = now + _biddingTime;

        bidstadium.addAuction(address(this));
    }
}