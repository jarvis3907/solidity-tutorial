// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AccessModifiers {
    // Public state variable: Accessible from within the contract, derived contracts, and externally.
    uint256 public publicInteger = 1;

    // Private state variable: Accessible only from within this contract.
    // It cannot be accessed from derived contracts or externally.
    uint256 private privateInteger = 1;

    /**
     * @dev Public function: Can be accessed from within the contract, derived contracts, and externally.
     * It is a `view` function, meaning it doesn't modify the state, it only reads from it.
     * Returns the value of `publicInteger`.
     */
    function getPublicMethod() public view returns (uint256) {
        return publicInteger;
    }

    /**
     * @dev Public function: Can be accessed from within the contract, derived contracts, and externally.
     * This function returns the value of the private variable `privateInteger`.
     * Although the variable `privateInteger` is private, the function itself is public,
     * so it can be called from outside the contract.
     */
    function getPrivateMethod() public view returns (uint256) {
        return privateInteger;
    }

    /**
     * @dev External function: Can only be called from outside the contract.
     * It is not accessible from within this contract using `this.getExternalMethod()`.
     * Returns the value of `publicInteger`.
     */
    function getExternalMethod() external view returns (uint256) {
        return publicInteger;
    }

    /**
     * @dev Public function: Can be accessed from within the contract, derived contracts, and externally.
     * This function is marked as `view` because it does not modify the contract's state; it only reads from it.
     * It returns two values:
     * - The value of `publicInteger` (a public state variable).
     * - The value of `privateInteger` (a private state variable).
     * The function demonstrates how multiple values can be returned from a single function in Solidity.
     */
    function getReturnMultipleValues() public view returns (uint256, uint256) {
        return (publicInteger, privateInteger);
    }

    /**
     * @dev Pure function: This function does not read from or modify the contract's state.
     * It takes two `uint256` numbers as input parameters and returns their sum.
     * @param a The first number to add.
     * @param b The second number to add.
     * @return The sum of `a` and `b`.
     */
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Pure function: This function calls another pure function `add` to compute the sum
     * of two numbers and then doubles the result. Since it does not interact with state variables,
     * it is marked as `pure`.
     * Only `pure` functions can call other `pure` functions because they do not modify the state.
     * @param x The first number to add.
     * @param y The second number to add.
     * @return The doubled sum of `x` and `y`.
     */
    function doubleSum(uint256 x, uint256 y) public pure returns (uint256) {
        // Calls another pure function `add`
        uint256 sum = add(x, y);
        return 2 * sum; // Returns double the sum
    }
}
