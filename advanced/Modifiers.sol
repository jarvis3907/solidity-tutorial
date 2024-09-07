// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title RestrictedCount Contract
 * @dev This contract allows only the owner to modify a count variable within a defined range.
 */
contract Modifiers {
    address owner;
    int256 count;

    /**
     * @dev Sets the contract deployer as the owner.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Modifier to restrict access to only the owner.
     */
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "this function can only be called by the owner"
        );
        _;
    }

    /**
     * @dev Modifier to check if adding a value keeps the count within the allowed range.
     * @param value The value to add to the count.
     */
    modifier addCheck(int256 value) {
        require(count + value <= 100, "resulting count must be <= 100");
        require(count + value >= -100, "resulting count must be >= -100");
        _;
    }

    /**
     * @dev Modifier to check if subtracting a value keeps the count within the allowed range.
     * @param value The value to subtract from the count.
     */
    modifier subtractCheck(int256 value) {
        require(count - value >= -100, "resulting count must be >= -100");
        require(count - value <= 100, "resulting count must be <= 100");
        _;
    }

    /**
     * @dev Adds a value to the count, ensuring it stays within the allowed range.
     * @param value The value to add.
     */
    function add(int256 value) public onlyOwner addCheck(value) {
        count += value;
    }

    /**
     * @dev Subtracts a value from the count, ensuring it stays within the allowed range.
     * @param value The value to subtract.
     */
    function subtract(int256 value) public onlyOwner subtractCheck(value) {
        count -= value;
    }

    /**
     * @dev Returns the current count value. Only the owner can view it.
     * @return The current count as an integer.
     */
    function getCount() public view onlyOwner returns (int256) {
        return count;
    }
}
