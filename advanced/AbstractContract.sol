// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title AbstractContract
 * @dev This abstract contract provides the structure for a sign-up bonus system with deposit and withdrawal functionalities.
 */
abstract contract AbstractContract {
    mapping(address => uint256) balances;
    mapping(address => bool) deposited;

    /**
     * @dev Internal function to get the bonus amount. Must be implemented by derived contracts.
     * @return The bonus amount as a uint256.
     */
    function getBonusAmount() internal pure virtual returns (uint256);

    /**
     * @dev Internal function to get the bonus requirement. Must be implemented by derived contracts.
     * @return The bonus requirement as a uint256.
     */
    function getBonusRequirement() internal pure virtual returns (uint256);

    /**
     * @dev Function to deposit Ether into the contract. If the user has not deposited before and meets the bonus requirement, a bonus is added.
     */
    function deposit() public payable {
        if (!deposited[msg.sender] && msg.value >= getBonusRequirement()) {
            balances[msg.sender] += getBonusAmount();
        }
        deposited[msg.sender] = true;
        balances[msg.sender] += msg.value;
    }

    /**
     * @dev Function to withdraw Ether from the contract.
     * @param amount The amount to withdraw.
     */
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Invalid amount");
        balances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "Failed to send");
    }

    /**
     * @dev Function to get the balance of the sender.
     * @return The balance of the sender as a uint256.
     */
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}

/**
 * @title Bank Contract
 * @dev This contract implements the AbstractContract and defines the bonus amount and bonus requirement.
 */
contract Bank is AbstractContract {
    /**
     * @dev Returns the bonus amount to be awarded.
     * @return The bonus amount as a uint256.
     */
    function getBonusAmount() internal pure override returns (uint256) {
        return 150 wei;
    }

    /**
     * @dev Returns the minimum deposit required to receive a bonus.
     * @return The bonus requirement amount as a uint256.
     */
    function getBonusRequirement() internal pure override returns (uint256) {
        return 1000 wei;
    }
}
