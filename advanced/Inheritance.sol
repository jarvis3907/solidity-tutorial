// Copyright © 2023 AlgoExpert LLC. All rights reserved.

// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Item Contract
 * @dev This contract represents a basic item with a name and price.
 */
contract Item {
    string public name;
    uint256 public price;

    /**
     * @dev Constructor to initialize the item with a name and price.
     * @param _name The name of the item.
     * @param _price The price of the item.
     */
    constructor(string memory _name, uint256 _price) {
        name = _name;
        price = _price;
    }

    /**
     * @dev Returns the name of the item.
     * @return The name of the item as a string.
     */
    function getName() public view returns (string memory) {
        return name;
    }

    /**
     * @dev Returns the price of the item.
     * @return The price of the item as a uint256.
     */
    function getPrice() public view virtual returns (uint256) {
        return price;
    }
}

/**
 * @title TaxedItem Contract
 * @dev This contract represents a taxed item that inherits from the Item contract.
 * It adds a tax value to the item's price.
 */
contract TaxedItem is Item {
    uint256 public tax;

    /**
     * @dev Constructor to initialize the taxed item with a name, price, and tax.
     * @param name The name of the taxed item.
     * @param price The price of the taxed item.
     * @param _tax The tax amount to be added to the price.
     */
    constructor(
        string memory name,
        uint256 price,
        uint256 _tax
    ) Item(name, price) {
        tax = _tax;
    }

    /**
     * @dev Returns the total price of the item including tax.
     * @return The total price of the item including tax as a uint256.
     */
    function getPrice() public view override returns (uint256) {
        return price + tax;
    }
}
