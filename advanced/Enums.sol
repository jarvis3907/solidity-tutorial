// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title FancyShirts Contract
 * @dev This contract allows users to buy shirts of different sizes and colors.
 */
contract Enums {
    /**
     * @dev Enum representing available shirt sizes.
     */
    enum Size {
        Small,
        Medium,
        Large
    }

    /**
     * @dev Enum representing available shirt colors.
     */
    enum Color {
        Red,
        Green,
        Blue
    }

    /**
     * @dev Struct representing a shirt with size and color.
     */
    struct Shirt {
        Size size;
        Color color;
    }

    mapping(address => Shirt[]) shirts;

    /**
     * @dev Modifier to check if the correct amount of Ether is sent for the specified shirt size and color.
     * @param size The size of the shirt.
     * @param color The color of the shirt.
     */
    modifier correctAmount(Size size, Color color) {
        require(
            getShirtPrice(size, color) == msg.value,
            "Incorrect amount sent"
        );
        _;
    }

    /**
     * @dev Returns the price of a shirt based on its size and color.
     * @param size The size of the shirt.
     * @param color The color of the shirt.
     * @return The price of the shirt in wei.
     */
    function getShirtPrice(Size size, Color color)
        public
        pure
        returns (uint256)
    {
        uint256 price;
        if (size == Size.Small) {
            price += 10;
        } else if (size == Size.Medium) {
            price += 15;
        } else {
            price += 20;
        }

        if (color != Color.Red) {
            price += 5;
        }

        return price;
    }

    /**
     * @dev Allows users to buy a shirt of a specific size and color by paying the correct amount.
     * @param size The size of the shirt.
     * @param color The color of the shirt.
     */
    function buyShirt(Size size, Color color) public payable correctAmount(size, color) {
        Shirt memory shirt = Shirt(size, color);
        shirts[msg.sender].push(shirt);
    }

    /**
     * @dev Returns the number of shirts owned by the caller of a specific size and color.
     * @param size The size of the shirt.
     * @param color The color of the shirt.
     * @return The count of shirts of the specified size and color owned by the caller.
     */
    function getShirts(Size size, Color color) public view returns (uint256) {
        uint256 count;
        for (uint256 idx = 0; idx < shirts[msg.sender].length; idx++) {
            if (
                shirts[msg.sender][idx].size == size &&
                shirts[msg.sender][idx].color == color
            ) {
                count++;
            }
        }
        return count;
    }
}
