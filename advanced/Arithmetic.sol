// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Arithmetic {
    /**
     * @dev Returns the floor of the given integer value to the nearest lower multiple of 10.
     * @param value The integer value to be floored.
     * @return The floored integer value to the nearest lower multiple of 10.
     */
    function floor(int256 value) public pure returns (int256) {
        int256 remainder = value % 10;
        return value - remainder;
    }

    /**
     * @dev Returns the ceiling of the given integer value to the nearest higher multiple of 10.
     * @param value The integer value to be ceiled.
     * @return The ceiled integer value to the nearest higher multiple of 10.
     */
    function ceil(int256 value) public pure returns (int256) {
        int256 remainder = value % 10;
        if (remainder > 0) {
            return value + (10 - remainder);
        } else if (remainder == 0) {
            return value;
        }
        return value - 10 - remainder;
    }

    /**
     * @dev Calculates the average of an array of integers and either floors or ceilings the result.
     * @param values The array of integer values to compute the average from.
     * @param down A boolean flag to determine if the average should be floored (true) or ceiled (false).
     * @return The floored or ceiled average of the input values.
     */
    function average(int256[] memory values, bool down)
        public
        pure
        returns (int256)
    {
        if (values.length == 0) {
            return 0;
        }

        int256 sum;
        for (uint256 idx = 0; idx < values.length; idx++) {
            sum += values[idx];
        }
        int256 avg = sum / int256(values.length);
        return down ? floor(avg) : ceil(avg);
    }
}

