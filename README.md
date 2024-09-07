# Solidity Smart Contracts Tutorial

This repository contains a collection of Solidity smart contracts that demonstrate various fundamental concepts and functionalities in Solidity development. These contracts are meant for educational purposes to help developers understand how to use Solidity to create decentralized applications (DApps) on the Ethereum blockchain.

## Table of Contents

### Basic Contracts
1. [AccessModifiers.sol](#1-accessmodifierssol)
2. [Arrays.sol](#2-arrayssol)
3. [Conditional.sol](#3-conditionalsol)
4. [Constructors.sol](#4-constructorssol)
5. [Event.sol](#5-eventsol)
6. [ExceptionAndErrorHandling.sol](#6-exceptionanderrorhandlingsol)
7. [GlobalKeywords.sol](#7-globalkeywordssol)
8. [HelloWorld.sol](#8-helloworldsol)
9. [Loop.sol](#9-loopsol)
10. [Mapping.sol](#10-mappingsol)
11. [SelfDestruct.sol](#11-selfdestructsol)
12. [SendingAndReceivingEth.sol](#12-sendingandreceivingethsol)
13. [Voting.sol](#13-votingsol)

### Advanced Contracts
1. [Arithmetic.sol](#1-arithmeticsol)
2. [Enums.sol](#2-enumssol)
3. [Inheritance.sol](#3-inheritancesol)
4. [Interface.sol](#4-interfacesol)
5. [AbstractContract.sol](#5-abstractcontractsol)
6. [Library.sol](#6-librarysol)
7. [Modifiers.sol](#7-modifierssol)
8. [Structs.sol](#8-structssol)
9. [Time.sol](#9-timesol)

## Basic Contracts

### 1. AccessModifiers.sol

This smart contract demonstrates the use of different access modifiers in Solidity:

- **`public`**: Functions and state variables that can be accessed internally from the contract, externally, and from derived contracts.
- **`private`**: Functions and state variables that are accessible only within the contract in which they are defined.
- **`external`**: Functions that can be called from other contracts and transactions, but not from within the contract itself.

The contract provides functions that showcase how these access modifiers work and the visibility of data in Solidity.

### 2. Arrays.sol

This contract demonstrates the use of arrays in Solidity, including how to declare, initialize, and manipulate both fixed-size and dynamic arrays. It provides examples of adding, updating, and deleting elements within an array.

### 3. Conditional.sol

The `Conditional.sol` contract demonstrates basic conditional logic in Solidity. It showcases:

- State variables `canEdit` and `canRead` that store boolean values.
- Functions to **toggle** (`changeEditState` and `changeReadState`) these boolean states, providing a way to turn features on and off.
- Functions to **read** the current state of `canEdit` and `canRead` (`getEdit` and `getRead`).

This contract is useful for understanding how to manage permissions or state conditions within smart contracts.

### 4. Constructors.sol

The `Constructors.sol` contract shows how to use constructors in Solidity, which are special functions executed only once when a contract is deployed. Constructors are useful for initializing state variables.

### 5. Event.sol

This contract demonstrates the use of events in Solidity, which are used for logging on the blockchain. It provides examples of how to declare and emit events, as well as how to listen for them from an external application.

### 6. ExceptionAndErrorHandling.sol

This contract showcases how to handle exceptions and errors in Solidity. It covers `require`, `assert`, and `revert` statements, which are essential for managing and debugging smart contracts.

### 7. GlobalKeywords.sol

This contract explores the use of several global keywords and variables that are available in Solidity to interact with the Ethereum blockchain:

- **`this`**: Refers to the current contract instance, used to get the contract's address and balance.
- **`msg`**: Contains information about the current transaction, such as the sender's address (`msg.sender`).
- **`block`**: Provides details about the blockchain, such as the current block number (`block.number`) and gas limit (`block.gaslimit`).

These global keywords are useful for various tasks, such as checking contract balance, verifying transaction origin, and understanding the blockchain state.

### 8. HelloWorld.sol

The classic "Hello World" example for Solidity development:

- A simple contract that introduces state management with Solidity.
- The `store(uint256 num)` function allows users to store a number in the contract's state.
- The `get()` function retrieves the stored number.

This basic contract is a great starting point for beginners to understand how to store and retrieve data on the Ethereum blockchain.

### 9. Loop.sol

The `Loop.sol` contract demonstrates the use of loops in Solidity, including `for`, `while`, and `do-while` loops. It explains how to iterate through data structures and manage gas usage effectively.

### 10. Mapping.sol

The `Mapping.sol` contract demonstrates how to use mappings in Solidity:

- **Simple Mapping**: `mapping(uint256 => bool) map;` which maps a `uint256` key to a boolean value. Functions are provided to add items to the mapping (`addItems`) and retrieve values (`get`).
- **Nested Mapping**: `mapping(uint256 => mapping(uint256 => bool)) nestedMap;` which allows for more complex data structures. Functions to add to the nested mapping (`addItemToNestedMap`) and retrieve from it (`getFromNestedMap`) are included.

Mappings are a core data structure in Solidity used to represent relationships and store data efficiently on the blockchain.

### 11. SelfDestruct.sol

This contract explains how to use the `selfdestruct` function in Solidity to delete a contract from the blockchain. It also shows how to send the remaining Ether in the contract to a specific address upon destruction.

### 12. SendingAndReceivingEth.sol

The `SendingAndReceivingEth.sol` contract demonstrates how to send and receive Ether in Solidity. It covers functions like `send`, `transfer`, and `call` to manage Ether transactions between contracts.

### 13. Voting.sol

This contract provides a basic implementation of a voting system in Solidity. It shows how to manage votes, voters, and proposals securely on the blockchain.

## Advanced Contracts

### 1. Arithmetic.sol

This contract demonstrates arithmetic operations in Solidity, such as addition, subtraction, multiplication, and division. It is useful for understanding how to handle basic mathematical operations and data types in Solidity.

### 2. Enums.sol

The `Enums.sol` contract showcases the use of enums to create user-defined types in Solidity. It includes functions to set and retrieve the values of enums, making it easier to manage multiple states or categories in smart contracts.

### 3. Inheritance.sol

This contract explains the concept of inheritance in Solidity, where a smart contract can inherit properties and methods from another contract. It demonstrates how to use the `is` keyword for inheritance and shows the order of constructor calls.

### 4. Interface.sol

The `Interface.sol` contract introduces the use of interfaces in Solidity, which allows contracts to interact with other contracts without knowing the full implementation. It is essential for understanding contract modularity and interaction.

### 5. AbstractContract.sol

This contract provides an example of an abstract contract in Solidity. It cannot be deployed directly and must be inherited by other contracts. It is useful for creating templates or base contracts that enforce certain methods in derived contracts.

### 6. Library.sol

The `Library.sol` contract shows how to create reusable libraries in Solidity. Libraries are similar to contracts but are meant to be stateless and can help save gas by reusing common functionality across multiple contracts.

### 7. Modifiers.sol

This contract demonstrates the use of custom function modifiers in Solidity. Modifiers are used to change the behavior of functions, such as restricting access or adding pre-conditions.

### 8. Structs.sol

The `Structs.sol` contract explains the use of structs to create complex data types in Solidity. It provides examples of how to declare, initialize, and use structs within contracts to manage more structured data.

### 9. Time.sol

This contract showcases how to work with time in Solidity, including timestamp manipulation and time-based conditions. It is useful for creating contracts with features like time-locks or expiring offers.

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
