// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GlobalKeywords {
    /**
     * @dev This function uses the `this` keyword to refer to the current contract instance.
     * The `this` keyword, when combined with `address(this)`, returns the address of the current contract.
     * `address(this).balance` retrieves the current Ether balance of the contract.
     * @return The Ether balance of the contract.
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @dev This function uses the `msg` keyword to access the message sender's address.
     * `msg.sender` is a global variable that represents the address of the account that called the function.
     * It is commonly used for authentication and access control.
     * @return The address of the caller (transaction sender).
     */
    function viewMessage() public view returns (address) {
        return msg.sender;
    }

    /**
     * @dev This function uses the `block` keyword to access blockchain properties.
     * `block.number` is a global variable that returns the number of the current block in the blockchain.
     * This can be used to measure time or determine the order of transactions.
     * @return The current block number.
     */
    function viewBlockNumber() public view returns (uint256) {
        return block.number;
    }

    /**
     * @dev This function also uses the `block` keyword to access the current block's gas limit.
     * `block.gaslimit` is a global variable that returns the gas limit of the current block.
     * It is useful for understanding the current constraints on gas usage for transactions in the block.
     * @return The gas limit of the current block.
     */
    function viewGasLimit() public view returns (uint256) {
        return block.gaslimit;
    }
}
