pragma solidity ^0.4.20;

contract DiceGame {
    // Structure representing the bet and choice of each participant
    struct Bet {
        uint amount; // Amount of the bet
        bool isSmall; // Whether the participant chose 'small'
        bool hasBet; // Whether the participant has placed a bet
    }

    mapping(address => Bet) public bets; // Record of bets placed by participants
    uint public totalAmount; // Total amount of bets
    uint public diceResult; // Result of the dice roll
    address public owner; // Owner of the contract
    uint public dicesCount;
    event BetPlaced(address indexed player, uint amount, bool isSmall);
    event DiceRolled(uint result);

    // Constructor
    function DiceGame() public {
        owner = msg.sender;
    }

    // Function for placing a bet
    function placeBet(bool _isSmall) payable public {
        require(msg.value > 0 && !bets[msg.sender].hasBet); // Ensure the bet amount is greater than 0 and the participant hasn't placed a bet
        bets[msg.sender] = Bet(msg.value, _isSmall, true); // Record the bet information
        totalAmount += msg.value; // Update the total amount of bets
        BetPlaced(msg.sender, msg.value, _isSmall); // Trigger the bet event
    }

    // Function for rolling the dice
    function rollDice() public {
        require(msg.sender == owner); // Only the contract owner can execute this function
        diceResult = (uint(keccak256(block.timestamp, block.difficulty)) % 6) + 1; // Generate a random number between 1 and 6
        DiceRolled(diceResult); // Trigger the dice roll event
        distributePrizes(); // Distribute the prizes
    }

    // Function for distributing prizes
    function distributePrizes() private {
        bool isSmall = diceResult <= 3; // Check if the result is 'small'
        for (uint i = 0; i < 6; i++) {
            address player = address(uint(owner) + i + 1); // Infer the participant's address from the address
            if (bets[player].hasBet && bets[player].isSmall == isSmall) {
                uint prize = (bets[player].amount * totalAmount) / (msg.value * 2); // Calculate the prize
                player.transfer(prize); // Send the prize
            }
            delete bets[player]; // Clear the participant's bet record
        }
        totalAmount = 0; // Reset the total amount of bets
    }
}
