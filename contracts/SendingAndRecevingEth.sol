// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EtherTransfer {
    /**
     * @dev Function to receive Ether. The contract can receive Ether by calling this function.
     * The `receive` keyword allows the contract to accept Ether without any calldata.
     */
    receive() external payable {
        // You can add logic here to handle received ETH, such as emitting an event
    }

    /**
     * @dev Fallback function to handle incoming transactions that do not match any function.
     * It also allows the contract to accept ETH when called.
     */
    fallback() external payable {
        // You can add logic here to handle received ETH, such as emitting an event
    }

    /**
     * @dev Function to send Ether from this contract to the specified recipient address.
     * The function checks if the contract has enough balance before sending ETH.
     * @param amount The amount of Ether (in wei) to send to the recipient address.
     */
    function sendEther(uint256 amount, address recipientAddress) public {
        address payableAddress = payable(recipientAddress);
        require(address(this).balance >= amount, "Insufficient balance in the contract.");
        
        (bool success, ) = payableAddress.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    /**
     * @dev Function to check the balance of the contract.
     * @return The balance of the contract in wei.
     */
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @dev Function to deposit Ether into this contract.
     * Ether sent to this function will be added to the contract's balance.
     */
    function depositEther() public payable {
        // Ether will be added to the contract's balance
        // You can add logic here, such as emitting an event to track deposits
    }
}
