// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Comparable Interface
 * @dev This interface defines the comparison operations that a contract must implement.
 */
interface Comparable {
    /**
     * @dev Compares if the current object is greater than another.
     * @param other The other Comparable object to compare against.
     * @return True if the current object is greater than the other, false otherwise.
     */
    function greaterThan(Comparable other) external view returns (bool);

    /**
     * @dev Compares if the current object is less than another.
     * @param other The other Comparable object to compare against.
     * @return True if the current object is less than the other, false otherwise.
     */
    function lessThan(Comparable other) external view returns (bool);

    /**
     * @dev Compares if the current object is equal to another.
     * @param other The other Comparable object to compare against.
     * @return True if the current object is equal to the other, false otherwise.
     */
    function equalTo(Comparable other) external view returns (bool);

    /**
     * @dev Returns the value associated with the Comparable object.
     * @return The value as an int256.
     */
    function getValue() external view returns (int256);
}

/**
 * @title Interface Contract
 * @dev This contract implements the Comparable interface for a vector represented by two integers, a and b.
 */
contract Interface is Comparable {
    int256 a;
    int256 b;

    /**
     * @dev Constructor to initialize the vector with two integers.
     * @param _a The first integer.
     * @param _b The second integer.
     */
    constructor(int256 _a, int256 _b) {
        a = _a;
        b = _b;
    }

    /**
     * @dev Returns the sum of the two integers representing the vector.
     * @return The sum of a and b as an int256.
     */
    function getValue() public view override returns (int256) {
        return a + b;
    }

    /**
     * @dev Checks if the current vector is greater than another vector.
     * @param other The other Comparable object to compare against.
     * @return True if the current vector's value is greater than the other vector's value, false otherwise.
     */
    function greaterThan(Comparable other)
        external
        view
        override
        returns (bool)
    {
        return getValue() > other.getValue();
    }

    /**
     * @dev Checks if the current vector is less than another vector.
     * @param other The other Comparable object to compare against.
     * @return True if the current vector's value is less than the other vector's value, false otherwise.
     */
    function lessThan(Comparable other)
        external
        view
        override
        returns (bool)
    {
        return getValue() < other.getValue();
    }

    /**
     * @dev Checks if the current vector is equal to another vector.
     * @param other The other Comparable object to compare against.
     * @return True if the current vector's value is equal to the other vector's value, false otherwise.
     */
    function equalTo(Comparable other)
        external
        view
        override
        returns (bool)
    {
        return getValue() == other.getValue();
    }
}
