// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Driveable
 * @dev Interface for a driveable vehicle that can start, stop, fuel up, and drive.
 */
interface Driveable {
    function startEngine() external;

    function stopEngine() external;

    function fuelUp(uint256 litres) external;

    function drive(uint256 kilometers) external;

    function kilometersRemaining() external view returns (uint256);
}

/**
 * @title GasVehicle
 * @dev Abstract contract implementing the Driveable interface for vehicles using gas.
 */
abstract contract GasVehicle is Driveable {
    uint256 litresRemaining;
    bool started;

    /**
     * @dev Modifier to ensure the tank size can accommodate additional fuel.
     * @param litres The amount of fuel to add.
     */
    modifier sufficientTankSize(uint256 litres) {
        require(litresRemaining + litres <= getFuelCapacity());
        _;
    }

    /**
     * @dev Modifier to ensure the vehicle has enough kilometers remaining.
     * @param kilometers The distance to be driven.
     */
    modifier sufficientKilometersRemaining(uint256 kilometers) {
        require(kilometersRemaining() >= litresRemaining);
        _;
    }

    /**
     * @dev Modifier to ensure the vehicle is not started.
     */
    modifier notStarted() {
        require(!started);
        _;
    }

    /**
     * @dev Modifier to ensure the vehicle is started.
     */
    modifier isStarted() {
        require(started);
        _;
    }

    /**
     * @dev Starts the engine of the vehicle.
     */
    function startEngine() external notStarted {
        started = true;
    }

    /**
     * @dev Stops the engine of the vehicle.
     */
    function stopEngine() external isStarted {
        started = false;
    }

    /**
     * @dev Fuels up the vehicle with the specified amount of litres.
     * @param litres The amount of fuel to add to the tank.
     */
    function fuelUp(uint256 litres) external sufficientTankSize(litres) notStarted {
        litresRemaining += litres;
    }

    /**
     * @dev Drives the vehicle for the specified distance.
     * @param kilometers The distance to drive.
     */
    function drive(uint256 kilometers) external isStarted sufficientKilometersRemaining(kilometers) {
        litresRemaining -= kilometers / getKilometersPerLitre();
    }

    /**
     * @dev Returns the kilometers the vehicle can drive with the remaining fuel.
     * @return uint256 The kilometers remaining.
     */
    function kilometersRemaining() public view returns (uint256) {
        return litresRemaining * getKilometersPerLitre();
    }

    /**
     * @dev Abstract function to get the kilometers per litre of the vehicle.
     * @return uint256 The kilometers per litre.
     */
    function getKilometersPerLitre() public view virtual returns (uint256);

    /**
     * @dev Abstract function to get the fuel capacity of the vehicle.
     * @return uint256 The fuel capacity.
     */
    function getFuelCapacity() public view virtual returns (uint256);
}

/**
 * @title Car
 * @dev Concrete implementation of GasVehicle representing a car.
 */
contract Car is GasVehicle {
    uint256 fuelTankSize;
    uint256 kilometersPerLitre;

    /**
     * @dev Constructor to initialize the car's fuel tank size and fuel efficiency.
     * @param _fuelTankSize The size of the fuel tank.
     * @param _kilometersPerLitre The fuel efficiency of the car.
     */
    constructor(uint256 _fuelTankSize, uint256 _kilometersPerLitre) {
        fuelTankSize = _fuelTankSize;
        kilometersPerLitre = _kilometersPerLitre;
    }

    /**
     * @dev Returns the kilometers per litre of the car.
     * @return uint256 The kilometers per litre.
     */
    function getKilometersPerLitre() public view override returns (uint256) {
        return kilometersPerLitre;
    }

    /**
     * @dev Returns the fuel capacity of the car.
     * @return uint256 The fuel capacity.
     */
    function getFuelCapacity() public view override returns (uint256) {
        return fuelTankSize;
    }
}
