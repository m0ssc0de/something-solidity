// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0  <0.9.0;

contract RockPaperScissors {
    enum ActionChoices { None, Rock, Paper, Scissors }
    address public currentWinner;
    ActionChoices public currentAction;
    address[] users;
    
    mapping(address => ActionChoices) reacted;
    
    function myChoice(uint256 choice) public {
        require(choice != 0, "please chooce a action from 1(Rock), 2(Paper), 3(Scissors)");
        if (reacted[msg.sender] == ActionChoices.None) {
            users.push(msg.sender);
        }
        reacted[msg.sender] = ActionChoices(choice);
    }

    function showMyChoice() public view returns (ActionChoices) {
        return reacted[msg.sender];
    }
    
    function findWinner() public payable  {
        uint  length = users.length;
        if (length == 0) {
            return;
        }
        if (length == 1) {
            currentWinner = users[0];
            currentAction = reacted[currentWinner];
            return;
        }
        
        currentWinner = users[0];
        currentAction = reacted[currentWinner];
        
        for (uint i = 1; i < (length); i++) {
            int256 diff = int(reacted[users[i]]) - int(currentAction);
            if (diff == 1) {
                currentWinner = users[i];
                currentAction = reacted[currentWinner];
            }
        }
        // big bug
    }
}