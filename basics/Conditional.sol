// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Contitional {
    // State variable to control edit permission.
    // Default value is set to `true`.
    bool private canEdit = true;

    // State variable to control read permission.
    // Default value is set to `true`.
    bool private canRead = true;

    /**
     * @dev Public view function that returns the current state of `canEdit`.
     * It indicates whether editing is allowed or not.
     * As a `view` function, it does not modify the contract's state and is used for reading purposes only.
     * @return A boolean value representing the edit permission (`true` if editing is allowed, `false` otherwise).
     */
    function getEdit() public view returns (bool) {
        return canEdit;
    }

    /**
     * @dev Public view function that returns the current state of `canRead`.
     * It indicates whether reading is allowed or not.
     * As a `view` function, it does not modify the contract's state and is used for reading purposes only.
     * @return A boolean value representing the read permission (`true` if reading is allowed, `false` otherwise).
     */
    function getRead() public view returns (bool) {
        return canRead;
    }

    /**
     * @dev Public function to toggle the `canEdit` state.
     * It switches the `canEdit` boolean value between `true` and `false`.
     * If `canEdit` is `true`, calling this function will set it to `false` and vice versa.
     * This function modifies the contract's state.
     */
    function changeEditState() public {
        canEdit = !canEdit; // Toggles canEdit between true and false
    }

    /**
     * @dev Public function to toggle the `canRead` state.
     * It switches the `canRead` boolean value between `true` and `false`.
     * If `canRead` is `true`, calling this function will set it to `false` and vice versa.
     * This function modifies the contract's state.
     */
    function changeReadState() public {
        canRead = !canRead; // Toggles canRead between true and false
    }
}
