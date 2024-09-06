// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/**
 * @title SelfDestruct Contract
 * @notice This contract demonstrates the use of selfdestruct in Solidity.
 * @dev The contract allows only the owner to destroy it and transfer any remaining Ether balance to the owner's address.
 */
contract SelfDestruct {
    
    /**
     * @notice The address of the contract owner.
     * @dev This is set at the time of contract deployment.
     */
    address owner;

    /**
     * @notice The constructor sets the deployer as the owner of the contract.
     * @dev The `msg.sender` is the address that deploys the contract.
     */
    constructor() {
        owner = msg.sender; /* Set the owner to the address that deploys the contract. */
    }

    /**
     * @notice A fallback function that allows the contract to receive Ether.
     * @dev This function is executed on a simple Ether transfer to the contract's address.
     */
    receive() external payable { 
        /* The contract can receive Ether. No function body is needed as it is a simple receive function. */
    }

    /**
     * @notice Destroys the contract and sends the remaining Ether to the owner's address.
     * @dev Only the owner can call this function. Once called, the contract is destroyed and its code is removed from the blockchain.
     * @dev The `selfdestruct` function also sends the remaining Ether to the owner's address.
     */
    function destroy() public {
        require(owner == msg.sender, "you are not owner"); /* Ensure the caller is the owner */
        selfdestruct(payable(owner)); /* Destroy the contract and send the remaining Ether to the owner's address */
    }

    /**
     * @notice Returns the address of the contract owner.
     * @dev This is a simple view function that returns the owner's address.
     * @return The address of the owner.
     */
    function getOwner() public view returns(address) {
        return owner; /* Return the owner's address */
    }
}
