// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract HelloWorldContract {
    function helloWorld() external pure returns(string memory) {
        return "hello world";
    }
    function haha() external pure returns(int) {
        return 123;
    }
    function testkw0() public pure returns(int) {
        return 222;
    }

        enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }

    // Since enum types are not part of the ABI, the signature of "getChoice"
    // will automatically be changed to "getChoice() returns (uint8)"
    // for all matters external to Solidity. The integer type used is just
    // large enough to hold all enum values, i.e. if you have more than 256 values,
    // `uint16` will be used and so on.
    function getChoice() public view returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }
}