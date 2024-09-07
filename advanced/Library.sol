// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Library Contract
 * @dev This contract provides basic array utility functions such as finding an index, counting occurrences, and summing up values.
 */
library Library {
    /**
     * @dev Finds the index of a target value in an array.
     * @param numbers The array of integers to search within.
     * @param target The target value to find.
     * @return The index of the target value if found; otherwise, -1.
     */
    function indexOf(int256[] memory numbers, int256 target)
        public
        pure
        returns (int256)
    {
        for (uint256 idx = 0; idx < numbers.length; idx++) {
            if (numbers[idx] == target) {
                return int256(idx);
            }
        }
        return -1;
    }

    /**
     * @dev Counts the occurrences of a target value in an array.
     * @param numbers The array of integers to search within.
     * @param target The target value to count.
     * @return The number of occurrences of the target value in the array.
     */
    function count(int256[] memory numbers, int256 target)
        public
        pure
        returns (uint256)
    {
        uint256 targetCount;
        for (uint256 idx = 0; idx < numbers.length; idx++) {
            if (numbers[idx] == target) {
                targetCount++;
            }
        }
        return targetCount;
    }

    /**
     * @dev Sums all values in an array.
     * @param numbers The array of integers to sum up.
     * @return The sum of all integers in the array.
     */
    function sum(int256[] memory numbers) public pure returns (int256) {
        int256 arraySum;
        for (uint256 idx = 0; idx < numbers.length; idx++) {
            arraySum += numbers[idx];
        }
        return arraySum;
    }
}
