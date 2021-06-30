// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract SimpleAuction {
    address payable public beneficiary;
    uint public auctionEnd;
    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) pendingReturns;
    bool ended;
    
    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEnd = block.timestamp + _biddingTime;
    }
    
    function bid() public payable {
        require(block.timestamp <= auctionEnd, "Auction already ended.");
        require(msg.value > highestBid, "There already is a higher bid.");
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
    }
    
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;
            
            if (!payable(msg.sender).send(amount)) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }
    
    function auctionEndd() public {
        require(block.timestamp >= auctionEnd, "Auction not yet ended.");
        require(!ended, "auctionEnd has already been called.");
        
        ended = true;
        
        beneficiary.transfer(highestBid);
    }
}