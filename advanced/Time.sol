// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/// @title Time Utility Contract
/// @dev Provides functions to get the current time and perform time calculations with different time units in Solidity.
contract Time {

    /**
     * @dev Returns the current block timestamp.
     * @return The current block timestamp in seconds since the Unix epoch.
     */
    function getTime() public view returns (uint256) {
        return block.timestamp;
    }

    /**
     * @dev Returns the block timestamp minus one day.
     * @return The current block timestamp minus 1 day, in seconds since the Unix epoch.
     */
    function getTimeMinusOneDay() public view returns (uint256) {
        return block.timestamp - 1 days;
    }

    /**
     * @dev Returns the block timestamp minus one second.
     * @return The current block timestamp minus 1 second, in seconds since the Unix epoch.
     */
    function getTimeMinusOneSecond() public view returns (uint256) {
        return block.timestamp - 1 seconds;
    }

    /**
     * @dev Returns the block timestamp minus one minute.
     * @return The current block timestamp minus 1 minute, in seconds since the Unix epoch.
     */
    function getTimeMinusOneMinute() public view returns (uint256) {
        return block.timestamp - 1 minutes;
    }

    /**
     * @dev Returns the block timestamp minus one hour.
     * @return The current block timestamp minus 1 hour, in seconds since the Unix epoch.
     */
    function getTimeMinusOneHour() public view returns (uint256) {
        return block.timestamp - 1 hours;
    }

    /**
     * @dev Returns the block timestamp minus one week.
     * @return The current block timestamp minus 1 week, in seconds since the Unix epoch.
     */
    function getTimeMinusOneWeek() public view returns (uint256) {
        return block.timestamp - 1 weeks;
    }
}
