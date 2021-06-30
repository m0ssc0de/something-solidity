// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0  <0.9.0;

contract RockPaperScissors {
    enum ActionChoices { Rock, Paper, Scissors }
    mapping(address => ActionChoices) actions;
    function showRock() public {
        actions[msg.sender] = ActionChoices.Rock;
    }
    function showPaper() public {
        actions[msg.sender] = ActionChoices.Paper;
    }
    function showScissors() public {
        actions[msg.sender] = ActionChoices.Scissors;
    }
    function myChoices() public view returns (ActionChoices) {
        return actions[msg.sender];
    }
}