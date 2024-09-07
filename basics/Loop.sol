// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Loop
 * @dev A contract that demonstrates a simple loop to compute the sum of all numbers up to a specified maximum.
 */
contract Loop {

    /**
     * @dev Computes the sum of all integers from 0 up to a specified maximum (exclusive).
     * This function uses a `for` loop to iterate from 0 to `max - 1` and adds each value to a cumulative sum.
     * @param max The upper limit (exclusive) for the summation.
     * @return sum The sum of all integers from 0 up to `max`.
     */
    function test(uint256 max) public pure returns (uint256) {
        uint256 sum = 0;  // Initialize sum to zero
        for (uint256 i = 0; i < max; i++) {
            sum += i;  // Add the value of `i` to sum in each iteration
        }
        return sum;  // Return the computed sum
    }
}
