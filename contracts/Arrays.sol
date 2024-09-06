// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Arrays
 * @dev A contract demonstrating the use of both fixed-size and dynamic-size arrays in Solidity.
 */
contract Arrays {
    // A fixed-size array of 5 unsigned integers, initialized with values.
    uint256[5] public fixedSizeArray = [1, 2, 4, 5, 6];

    // A dynamic-size array of unsigned integers that can be modified during runtime.
    uint256[] public dynamicSizeArray;

    /**
     * @dev Adds a new element to the end of the dynamic array.
     * @param x The value to be added to the dynamicSizeArray.
     */
    function add(uint256 x) public {
        dynamicSizeArray.push(x);
    }

    /**
     * @dev Removes the last element from the dynamic array.
     * The length of the array is reduced by one.
     */
    function pop() public {
        dynamicSizeArray.pop();
    }

    /**
     * @dev Returns the current length of the dynamic array.
     * @return The length of the dynamicSizeArray.
     */
    function length() public view returns (uint256) {
        return dynamicSizeArray.length;
    }

    /**
     * @dev Removes an element from the fixed-size array by setting it to the default value (0).
     * Note: This does not change the array's length, as it's fixed.
     * @param idx The index of the element to be removed from the fixedSizeArray.
     */
    function remove(uint256 idx) public {
        delete fixedSizeArray[idx];
    }

    /**
     * @dev Demonstrates creating a memory array in a function. This is a temporary array that exists only in memory.
     * It is used here purely for illustrative purposes.
     */
    function test() public {
        // A fixed-size array in memory with 3 unsigned integers.
        uint[3] memory numbers = [uint(1), uint(2), uint(3)];
    }
}
