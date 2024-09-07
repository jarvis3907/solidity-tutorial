// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Employee
 * @dev A contract to manage employee details and their pay.
 */
contract Employee {
    enum Department {
        Gardening,
        Clothing,
        Tools
    }

    string firstName;
    string lastName;
    uint256 hourlyPay;
    Department department;

    /**
     * @dev Constructor to initialize the employee details.
     * @param _firstName The first name of the employee.
     * @param _lastName The last name of the employee.
     * @param _hourlyPay The hourly pay rate of the employee.
     * @param _department The department the employee belongs to.
     */
    constructor(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Department _department
    ) {
        firstName = _firstName;
        lastName = _lastName;
        hourlyPay = _hourlyPay;
        department = _department;
    }

    /**
     * @dev Calculates the weekly pay for the employee based on hours worked.
     * @param hoursWorked The number of hours worked by the employee.
     * @return uint256 The total weekly pay.
     */
    function getWeeklyPay(uint256 hoursWorked) public view returns (uint256) {
        if (hoursWorked <= 40) {
            return hourlyPay * hoursWorked;
        }
        uint256 overtimeHours = hoursWorked - 40;
        return 40 * hourlyPay + (overtimeHours * 2 * hourlyPay);
    }

    /**
     * @dev Gets the first name of the employee.
     * @return string The first name of the employee.
     */
    function getFirstName() public view returns (string memory) {
        return firstName;
    }
}

/**
 * @title Manager
 * @dev A contract that inherits from Employee and manages subordinates.
 */
contract Manager is Employee {
    Employee[] subordinates;

    /**
     * @dev Constructor to initialize the manager details.
     * @param _firstName The first name of the manager.
     * @param _lastName The last name of the manager.
     * @param _hourlyPay The hourly pay rate of the manager.
     * @param _department The department the manager belongs to.
     */
    constructor(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Department _department
    ) Employee(_firstName, _lastName, _hourlyPay, _department) {}

    /**
     * @dev Adds a subordinate to the manager.
     * @param _firstName The first name of the subordinate.
     * @param _lastName The last name of the subordinate.
     * @param _hourlyPay The hourly pay rate of the subordinate.
     * @param _department The department the subordinate belongs to.
     */
    function addSubordinate(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Department _department
    ) public {
        Employee employee = new Employee(
            _firstName,
            _lastName,
            _hourlyPay,
            _department
        );
        subordinates.push(employee);
    }

    /**
     * @dev Gets the list of subordinates' first names managed by the manager.
     * @return string[] The list of first names of subordinates.
     */
    function getSubordinates() public view returns (string[] memory) {
        string[] memory names = new string[](subordinates.length);
        for (uint256 idx; idx < subordinates.length; idx++) {
            names[idx] = subordinates[idx].getFirstName();
        }
        return names;
    }
}
