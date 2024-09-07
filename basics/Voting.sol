// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Voting
 * @dev This contract allows people to vote for their favorite number within the range of 1 to 5 (inclusive). 
 * Each person is allowed to vote only once. The contract keeps track of the number of votes for each number 
 * and can determine which number has the most votes.
 *
 * The contract implements the following methods:
 *
 * 1. getVotes(uint8 number): Returns the number of votes for the passed number.
 *    If the number is not in the range of 1-5, the function call should fail.
 *
 * 2. vote(uint8 number): Allows a user to vote for the passed number. 
 *    The function call should fail if the user has already voted or if they pass an invalid number.
 *
 * 3. getCurrentWinner(): Returns the number that currently has the most votes.
 *    If two numbers have the same number of votes, it returns the number that received the most recent vote. 
 *    If no numbers have received any votes, it returns 1.
 */
contract Voting {
    // Mapping to track whether an address has voted
    mapping(address => bool) public voted;
    
    // Mapping to keep track of votes for each number (1 to 5)
    mapping(uint8 => uint8) public voteMap;
    
    // Variable to store the current winning number
    uint8 public currentWinner;
    
    // Variable to store the highest number of votes received
    uint8 public mostVotes;

    /**
     * @dev Allows a user to vote for a number in the range of 1 to 5.
     * Reverts if the user has already voted or if the number is out of range.
     * @param number The number to vote for.
     */
    function vote(uint8 number) public {
        require(!voted[msg.sender], "Address has already voted");
        require(number >= 1 && number <= 5, "Number is not in the range");

        // Mark the address as having voted
        voted[msg.sender] = true;
        
        // Increment the vote count for the chosen number
        voteMap[number]++;
        
        // Update the current winner if this number has more or equal votes
        if (voteMap[number] >= mostVotes) {
            currentWinner = number;
            mostVotes = voteMap[number];
        }
    }

    /**
     * @dev Returns the number of votes for a specific number.
     * Reverts if the number is out of range.
     * @param number The number to get the vote count for.
     * @return The vote count for the specified number.
     */
    function getVotes(uint8 number) public view returns (uint256) {
        require(number >= 1 && number <= 5, "Number is not in the range");
        return voteMap[number];
    }

    /**
     * @dev Returns the number that currently has the most votes.
     * If two numbers have the same number of votes, it returns the number that received the most recent vote.
     * If no votes have been cast, it returns 1.
     * @return The number with the most votes or 1 if no votes have been cast.
     */
    function getCurrentWinner() public view returns (uint256) {
        // Return 1 if no votes have been cast
        if (currentWinner == 0) {
            return 1;
        }
        return currentWinner;
    }
}
