// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract HelloWorld {
    // State variable to store a number.
    uint256 private number;

    /**
     * @dev Stores a given number in the contract's state.
     * The `number` state variable is updated with the new value provided by the caller.
     * This function modifies the contract's state, so it requires a transaction to execute.
     * @param num The number to be stored in the contract.
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Returns the currently stored number.
     * This is a `view` function, meaning it does not modify the state of the contract.
     * It allows reading the value of the `number` state variable without costing gas when called externally.
     * @return The number stored in the contract.
     */
    function get() public view returns (uint256) {
        return number;
    }
}
