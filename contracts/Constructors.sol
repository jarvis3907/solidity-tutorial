// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Constructors Example
 * @dev This contract demonstrates the use of constructors in Solidity.
 * The contract initializes an `owner` variable through the constructor and provides 
 * a way to receive Ether and withdraw it only by the owner.
 */
contract Constructors {
    // State variable to store the owner's address
    address public owner;

    /**
     * @dev Constructor that sets the deployer of the contract as the owner.
     * The constructor is executed once when the contract is deployed.
     */
    constructor() {
        owner = msg.sender; // Set the owner to the address that deployed the contract
    }

    /**
     * @dev Function to receive Ether. `external` function marked as `payable` 
     * allows the contract to accept Ether without any calldata.
     * This function is triggered whenever Ether is sent to the contract address.
     */
    receive() external payable {}

    /**
     * @dev Withdraw function allows the owner to withdraw a specified `amount` of Ether from the contract.
     * Reverts if the caller is not the owner or if the contract balance is insufficient.
     * @param amount The amount of Ether (in wei) to withdraw from the contract.
     */
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "You are not the owner"); // Ensure that only the owner can withdraw
        require(address(this).balance >= amount, "Balance is not sufficient"); // Check if the contract has enough balance
        
        // Transfer the specified amount to the owner
        (bool sent, ) = payable(owner).call{value: amount}("");
        require(sent, "Failed to send Ether"); // Revert if the transfer fails
    }
}
