// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Friends
 * @dev A contract to manage a basic friend request system.
 */
contract ExampleWithAllConcepts {
    struct Person {
        address[] friends;
        address[] requestsSent;
        address[] requestsReceived;
    }

    // Mapping to store people data
    mapping(address => Person) people;

    /**
     * @dev Checks if an address is contained within an array.
     * @param array The array to search.
     * @param target The address to find.
     * @return bool True if the target is found in the array, otherwise false.
     */
    function arrayContains(address[] memory array, address target)
        internal
        pure
        returns (bool)
    {
        for (uint256 idx; idx < array.length; idx++) {
            if (array[idx] == target) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Deletes an address from an array by replacing it with the last element and popping the last element.
     * @param array The storage array to delete from.
     * @param target The address to delete.
     */
    function deleteFromArray(address[] storage array, address target) internal {
        uint256 targetIdx;
        for (uint256 idx; idx < array.length; idx++) {
            if (array[idx] == target) {
                targetIdx = idx;
                break;
            }
        }

        uint256 lastIdx = array.length - 1;
        address lastValue = array[lastIdx];
        array[lastIdx] = target;
        array[targetIdx] = lastValue;
        array.pop();
    }

    // Modifiers to ensure various conditions are met before executing functions

    modifier requestNotSent(address friend) {
        address[] memory requestsSent = people[msg.sender].requestsSent;
        require(
            !arrayContains(requestsSent, friend),
            "You have already sent this user a request"
        );
        _;
    }

    modifier requestNotReceived(address friend) {
        address[] memory requestsReceived = people[msg.sender].requestsReceived;
        require(
            !arrayContains(requestsReceived, friend),
            "This user has already sent you a request"
        );
        _;
    }

    modifier requestExists(address friend) {
        address[] memory requestsReceived = people[msg.sender].requestsReceived;
        require(
            arrayContains(requestsReceived, friend),
            "This user has not sent you a request"
        );
        _;
    }

    modifier notAlreadyFriends(address friend) {
        address[] memory friends = people[msg.sender].friends;
        require(
            !arrayContains(friends, friend),
            "You are already friends with this user"
        );
        _;
    }

    modifier notSelf(address friend) {
        require(
            friend != msg.sender,
            "You cannot send a friend request to yourself"
        );
        _;
    }

    /**
     * @dev Gets the friend requests received by the sender.
     * @return address[] The list of addresses that have sent a friend request.
     */
    function getFriendRequests() public view returns (address[] memory) {
        return people[msg.sender].requestsReceived;
    }

    /**
     * @dev Gets the number of friends of the sender.
     * @return uint256 The number of friends.
     */
    function getNumberOfFriends() public view returns (uint256) {
        return people[msg.sender].friends.length;
    }

    /**
     * @dev Sends a friend request to another address.
     * @param friend The address to send a friend request to.
     */
    function sendFriendRequest(address friend)
        public
        requestNotSent(friend)
        requestNotReceived(friend)
        notAlreadyFriends(friend)
        notSelf(friend)
    {
        people[msg.sender].requestsSent.push(friend);
        people[friend].requestsReceived.push(msg.sender);
    }

    /**
     * @dev Accepts a friend request from another address.
     * @param friend The address whose friend request is to be accepted.
     */
    function acceptFriendRequest(address friend) public requestExists(friend) {
        deleteFromArray(people[msg.sender].requestsReceived, friend);
        deleteFromArray(people[friend].requestsSent, msg.sender);
        people[msg.sender].friends.push(friend);
        people[friend].friends.push(msg.sender);
    }

    /**
     * @dev Gets the list of friends of the sender.
     * @return address[] The list of friends.
     */
    function getFriends() public view returns (address[] memory) {
        return people[msg.sender].friends;
    }
}
