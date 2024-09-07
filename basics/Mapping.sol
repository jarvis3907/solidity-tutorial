// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Mapping {
    // Simple mapping that associates a uint256 key with a boolean value.
    mapping(uint256 => bool) private map;

    // Nested mapping that associates a uint256 key with another mapping,
    // which then maps a uint256 key to a boolean value.
    mapping(uint256 => mapping(uint256 => bool)) private nestedMap;

    /**
     * @dev Adds or updates an item in the `map` mapping.
     * Mappings do not have a length or a concept of keys that do not exist. 
     * Assigning a value to a key will add it if it does not exist or update it if it does.
     * @param key The key in the mapping to add or update.
     * @param value The boolean value to associate with the given key.
     */
    function addItems(uint256 key, bool value) public {
        map[key] = value;
    }

    /**
     * @dev Retrieves the value associated with a given key in the `map` mapping.
     * If the key does not exist in the mapping, it returns the default value of the data type.
     * For `bool`, the default value is `false`.
     * For `int` or `uint`, the default value is `0`.
     * @param key The key to look up in the mapping.
     * @return The boolean value associated with the given key, or `false` if the key does not exist.
     */
    function get(uint256 key) public view returns (bool) {
        return map[key];
    }

    /**
     * @dev Adds or updates an item in the `nestedMap` nested mapping.
     * This function demonstrates how to work with nested mappings in Solidity.
     * A nested mapping allows you to map a key to another mapping.
     * @param key1 The first key in the nested mapping.
     * @param key2 The second key within the mapping associated with `key1`.
     * @param value The boolean value to associate with the given keys.
     */
    function addItemToNestedMap(
        uint256 key1,
        uint256 key2,
        bool value
    ) public {
        nestedMap[key1][key2] = value;
    }

    /**
     * @dev Retrieves the value associated with the given keys in the `nestedMap` mapping.
     * Similar to simple mappings, if the keys do not exist, the default value for `bool` (false) is returned.
     * @param key1 The first key in the nested mapping.
     * @param key2 The second key within the mapping associated with `key1`.
     * @return The boolean value associated with the given keys, or `false` if the keys do not exist.
     */
    function getFromNestedMap(uint256 key1, uint256 key2)
        public
        view
        returns (bool)
    {
        return nestedMap[key1][key2];
    }
}
