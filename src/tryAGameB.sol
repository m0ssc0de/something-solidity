// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;

contract RockPaperScissors {
    enum ActionChoices { None, Rock, Paper, Scissors }
    mapping(address => ActionChoices) public usersAction;
    mapping(ActionChoices => address[]) public actionUsers;
    
    function myChoice(uint256 _choice) public {
        
        require(_choice != 0, "Need a choice which is not None(0). Rock(1), Paper(2), Scissors(3)");
        address sender = msg.sender;
        
        ActionChoices choice = ActionChoices(_choice);
        
        require(usersAction[sender] == ActionChoices.None, "You only have one chance.");

        actionUsers[choice].push(sender);
        usersAction[sender] = choice;
    }
    
    function judge() public view returns (address[] memory winers) {
        uint numberOfRock = actionUsers[ActionChoices.Rock].length;
        uint numberOfPaper = actionUsers[ActionChoices.Paper].length;
        uint numberOfScissors = actionUsers[ActionChoices.Scissors].length;
        if (numberOfRock == 0 && numberOfPaper == 0 && numberOfScissors == 0) {
            address[] memory empty;
            return empty;
        }
       if (numberOfRock != 0 && numberOfPaper != 0 && numberOfScissors != 0) {
            address[] memory empty;
            return empty;
        }
        if (numberOfRock != 0 && numberOfPaper == 0 && numberOfScissors == 0) {
            return actionUsers[ActionChoices.Rock];
        }
        if (numberOfRock == 0 && numberOfPaper != 0 && numberOfScissors == 0) {
            return actionUsers[ActionChoices.Paper];
        }
        if (numberOfRock == 0 && numberOfPaper == 0 && numberOfScissors != 0) {
            return actionUsers[ActionChoices.Scissors];
        }
        if (numberOfRock != 0 && numberOfPaper != 0 && numberOfScissors == 0) {
            return actionUsers[ActionChoices.Paper];
        }
        if (numberOfRock == 0 && numberOfPaper != 0 && numberOfScissors != 0) {
            return actionUsers[ActionChoices.Scissors];
        }
        if (numberOfRock != 0 && numberOfPaper == 0 && numberOfScissors != 0) {
            return actionUsers[ActionChoices.Rock];
        }
    }
}