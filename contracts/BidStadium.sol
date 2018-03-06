pragma solidity ^0.4.17;

import './Auction.sol';

contract BidStadium {
    address public creator;

    address public bidstadium;

    uint public fee = 5;

    address[] public auctionsList;

    struct Auctions {
        address addr;
    }

    mapping(address => Auctions) public auctions;

    
    function BidStadium () public {
        creator = msg.sender;

        bidstadium = address(this);
    }

    function createAuction (uint biddingTime) public returns (Auction auction) {
        return new Auction(bidstadium, msg.sender, biddingTime);
    }

    function addAuction (address auction) public {
        auctions[auction].addr = address(auction);
        // Auctions memory newAuction;
        // newAuction.addr = auction;
        // auctions.push(newAuction);
        auctionsList.push(address(auction));
    }

    function getAuctions() view public returns (address[]) {
        return auctionsList;
    }

    function getAuction (address auctionAddress) view public returns (Auctions auction) {
        return auctions[auctionAddress];
    }
}