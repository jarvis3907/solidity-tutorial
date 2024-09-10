// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Shopping List Contract
 * @dev This contract allows users to create, manage, and interact with their personal shopping lists.
 */
contract Structs {
    mapping(address => User) users;

    /**
     * @dev Structure to store user data, including their lists and list names.
     */
    struct User {
        mapping(string => List) lists;
        string[] listNames;
    }

    /**
     * @dev Structure to represent an item in a shopping list.
     * @param name Name of the item.
     * @param quantity Quantity of the item.
     */
    struct Item {
        string name;
        uint256 quantity;
    }

    /**
     * @dev Structure to represent a shopping list, which contains a list name and an array of items.
     * @param name Name of the shopping list.
     * @param items Array of items in the shopping list.
     */
    struct List {
        string name;
        Item[] items;
    }

    /**
     * @dev Checks if a list with a given name exists for the sender.
     * @param name The name of the list to check.
     * @return A boolean indicating if the list exists.
     */
    function listExists(string memory name) internal view returns (bool) {
        // If name of accessed list is empty, then the list has not been created
        return bytes(users[msg.sender].lists[name].name).length != 0;
    }

    /**
     * @dev Creates a new shopping list for the sender with the specified name.
     * @param name The name of the list to create.
     */
    function createList(string memory name) public {
        require(!listExists(name), "A list with this name already exists");
        require(bytes(name).length > 0, "Name cannot be empty");
        users[msg.sender].listNames.push(name);
        users[msg.sender].lists[name].name = name;
    }

    /**
     * @dev Retrieves the names of all lists created by the sender.
     * @return An array of strings containing the names of the lists.
     */
    function getListNames() public view returns (string[] memory) {
        return users[msg.sender].listNames;
    }

    /**
     * @dev Retrieves the names of all items in a specific list created by the sender.
     * @param listName The name of the list to retrieve item names from.
     * @return An array of strings containing the names of the items in the list.
     */
    function getItemNames(string memory listName) public view returns (string[] memory) {
        require(listExists(listName), "No list with this name exists");
        string[] memory names = new string[](
            users[msg.sender].lists[listName].items.length
        );
        for (uint256 idx = 0; idx < names.length; idx++) {
            names[idx] = users[msg.sender].lists[listName].items[idx].name;
        }
        return names;
    }

    /**
     * @dev Adds an item with a specified name and quantity to a specific list created by the sender.
     * @param listName The name of the list to add the item to.
     * @param itemName The name of the item to add.
     * @param quantity The quantity of the item to add.
     */
    function addItem(
        string memory listName,
        string memory itemName,
        uint256 quantity
    ) public {
        require(listExists(listName), "No list with this name exists");
        users[msg.sender].lists[listName].items.push(Item(itemName, quantity));
    }
}
