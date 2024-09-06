# Solidity Smart Contracts Tutorial

This repository contains a collection of Solidity smart contracts that demonstrate various fundamental concepts and functionalities in Solidity development. These contracts are meant for educational purposes to help developers understand how to use Solidity to create decentralized applications (DApps) on the Ethereum blockchain.

## Table of Contents

1. [AccessModifiers.sol](#accessmodifierssol)
2. [GlobalKeywords.sol](#globalkeywordssol)
3. [Conditional.sol](#conditionalsol)
4. [HelloWorld.sol](#helloworldsol)
5. [Mapping.sol](#mappingsol)

## Contracts

### 1. AccessModifiers.sol

This smart contract demonstrates the use of different access modifiers in Solidity:

- **`public`**: Functions and state variables that can be accessed internally from the contract, externally, and from derived contracts.
- **`private`**: Functions and state variables that are accessible only within the contract in which they are defined.
- **`external`**: Functions that can be called from other contracts and transactions, but not from within the contract itself.

The contract provides functions that showcase how these access modifiers work and the visibility of data in Solidity.

### 2. GlobalKeywords.sol

This contract explores the use of several global keywords and variables that are available in Solidity to interact with the Ethereum blockchain:

- **`this`**: Refers to the current contract instance, used to get the contract's address and balance.
- **`msg`**: Contains information about the current transaction, such as the sender's address (`msg.sender`).
- **`block`**: Provides details about the blockchain, such as the current block number (`block.number`) and gas limit (`block.gaslimit`).

These global keywords are useful for various tasks, such as checking contract balance, verifying transaction origin, and understanding the blockchain state.

### 3. Conditional.sol

The `Conditional.sol` contract demonstrates basic conditional logic in Solidity. It showcases:

- State variables `canEdit` and `canRead` that store boolean values.
- Functions to **toggle** (`changeEditState` and `changeReadState`) these boolean states, providing a way to turn features on and off.
- Functions to **read** the current state of `canEdit` and `canRead` (`getEdit` and `getRead`).

This contract is useful for understanding how to manage permissions or state conditions within smart contracts.

### 4. HelloWorld.sol

The classic "Hello World" example for Solidity development:

- A simple contract that introduces state management with Solidity.
- The `store(uint256 num)` function allows users to store a number in the contract's state.
- The `get()` function retrieves the stored number.

This basic contract is a great starting point for beginners to understand how to store and retrieve data on the Ethereum blockchain.

### 5. Mapping.sol

The `Mapping.sol` contract demonstrates how to use mappings in Solidity:

- **Simple Mapping**: `mapping(uint256 => bool) map;` which maps a `uint256` key to a boolean value. Functions are provided to add items to the mapping (`addItems`) and retrieve values (`get`).
- **Nested Mapping**: `mapping(uint256 => mapping(uint256 => bool)) nestedMap;` which allows for more complex data structures. Functions to add to the nested mapping (`addItemToNestedMap`) and retrieve from it (`getFromNestedMap`) are included.

Mappings are a core data structure in Solidity used to represent relationships and store data efficiently on the blockchain.

## Getting Started

To run these smart contracts, you can use any Ethereum development environment such as:

- [Remix IDE](https://remix.ethereum.org/)
- [Truffle](https://www.trufflesuite.com/)
- [Hardhat](https://hardhat.org/)

### Prerequisites

- MetaMask or other Ethereum wallet for deployment and testing

### Installation

Clone the repository:

```bash
git clone https://github.com/jarvis3907/solidity-smart-contracts.git
cd solidity-smart-contracts
