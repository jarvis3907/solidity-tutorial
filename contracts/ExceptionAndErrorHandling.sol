// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @dev Global error definition for handling insufficient balance errors
 * outside of any specific contract scope.
 */
error BalanceNotLargeEnoughOnGlobalSpace(uint256 balance, uint256 amount);

/**
 * @title Exception and Error Handling Contract
 * @dev Demonstrates various error handling mechanisms in Solidity:
 * - `require`: Checks for valid conditions and inputs.
 * - `revert`: Handles custom error messages and state reverting.
 * - `assert`: Checks for code invariants.
 * - Custom Errors: Allows efficient error handling with custom error types.
 *
 * This contract includes examples of errors defined both globally and inside the contract.
 */
contract ExceptionAndErrorHandling {

    /**
     * @dev Custom error defined inside the contract for handling insufficient balance errors.
     */
    error BalanceNotLargeEnoughInsideContract(uint256 balance, uint256 amount);

    // Mapping to keep track of user balances
    mapping(address => uint256) balances;

    /**
     * @dev Deposit function to add Ether to the sender's balance.
     * The payable modifier allows the function to receive Ether.
     */
    function deposit() external payable {
        // Increase the sender's balance by the value sent in the transaction
        balances[msg.sender] += msg.value;
    }

    /**
     * @dev Withdraw function to withdraw a specified amount of Ether from the sender's balance.
     * Includes error handling using require, assert, and revert, as well as custom errors.
     * @param amount The amount of Ether (in wei) to withdraw.
     */
    function withdraw(uint256 amount) public {
        uint256 balance = balances[msg.sender];  // Get the sender's current balance
        
        // Require statement to check if the balance is sufficient to withdraw
        require(balance >= amount, "Balance is not sufficient");

        // Demonstrate a custom error defined at the global level
        if (balance < amount) {
            revert BalanceNotLargeEnoughOnGlobalSpace(balance, amount);
        }

        // Demonstrate a custom error defined inside the contract
        if (balance < amount) {
            revert BalanceNotLargeEnoughInsideContract(balance, amount);
        }

        // Deduct the amount from the sender's balance
        balances[msg.sender] -= amount;

        // Send the Ether to the sender
        (bool sent, ) = payable(msg.sender).call{value: amount}("");

        // Assert statement to check the contract's internal state after the operation
        assert(balances[msg.sender] == balance - amount);

        // Revert with an error message if the transfer fails
        if (!sent) {
            revert("Payment failed");
        }
    }
}
