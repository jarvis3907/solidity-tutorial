// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Event Contract
 * @notice This contract demonstrates a simple auction system with bidding and withdrawal functionalities using events.
 * @dev Events are used to log bids and the stopping of the auction. The contract owner is the only one who can stop the auction.
 */
contract Event {
    address owner;  // Address of the contract owner
    uint256 highestBid;  // Current highest bid in the auction
    address highestBidder;  // Address of the current highest bidder
    mapping(address => uint256) oldBids;  // Mapping to store previous bids of each bidder

    /**
     * @dev Emitted when a new bid is placed.
     * @param bidder The address of the bidder.
     * @param value The value of the bid.
     */
    event Bid(address indexed bidder, uint256 value);

    /**
     * @dev Emitted when the auction is stopped.
     * @param highestBidder The address of the highest bidder.
     * @param value The value of the highest bid.
     */
    event StopAuction(address indexed highestBidder, uint256 value);

    /**
     * @notice Initializes the contract and sets the contract deployer as the owner.
     * @dev The owner will have the ability to stop the auction.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Allows users to place a bid in the auction.
     * @dev Bids must be higher than the current highest bid, and the owner cannot place a bid.
     * @dev Emits a {Bid} event on a successful bid.
     */
    function bid() external payable {
        require(msg.value > highestBid, "Bid too low");  // Ensure the bid is higher than the current highest bid
        require(owner != msg.sender, "Owner cannot bid");  // Ensure the owner is not bidding
        oldBids[highestBidder] = highestBid;  // Store the previous highest bid for withdrawal purposes
        highestBid = msg.value;  // Update the highest bid
        highestBidder = msg.sender;  // Update the highest bidder
        emit Bid(highestBidder, highestBid);  // Emit an event logging the new highest bid
    }

    /**
     * @notice Allows users to withdraw their previous bids.
     * @dev The owner cannot withdraw as they are not allowed to place bids.
     * @dev Withdrawals are processed using the `call` method to prevent reentrancy attacks.
     */
    function withdraw() external {
        require(msg.sender != owner, "Owner cannot withdraw");  // Ensure the owner is not withdrawing
        uint256 value = oldBids[msg.sender];  // Get the amount the caller has previously bid
        oldBids[msg.sender] = 0;  // Reset the caller's bid to prevent reentrancy attacks
        (bool sent, ) = payable(msg.sender).call{value: value}("");  // Attempt to send the Ether back to the caller
        require(sent, "Payment failed");  // Ensure the payment was successful
    }

    /**
     * @notice Allows the owner to stop the auction and finalize the highest bid.
     * @dev Only the owner can call this function. The contract is destroyed after the auction is stopped.
     * @dev Emits a {StopAuction} event before destroying the contract.
     */
    function stopAuction() external {
        require(msg.sender == owner, "Owner only can stop");  // Ensure only the owner can stop the auction
        emit StopAuction(highestBidder, highestBid);  // Emit an event logging the auction stop
        selfdestruct(payable(owner));  // Destroy the contract and send the remaining funds to the owner
    }
}
