// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Game
 * @dev An abstract contract representing a generic game between two teams.
 */
abstract contract Game {
    string homeTeam;
    string awayTeam;

    /**
     * @dev Constructor to initialize the home and away teams.
     * @param _homeTeam The name of the home team.
     * @param _awayTeam The name of the away team.
     */
    constructor(string memory _homeTeam, string memory _awayTeam) {
        homeTeam = _homeTeam;
        awayTeam = _awayTeam;
    }

    /**
     * @dev Abstract function to get the score of the home team.
     * @return uint256 The score of the home team.
     */
    function getHomeTeamScore() internal view virtual returns (uint256);

    /**
     * @dev Abstract function to get the score of the away team.
     * @return uint256 The score of the away team.
     */
    function getAwayTeamScore() internal view virtual returns (uint256);

    /**
     * @dev Returns the team with the highest score.
     * @return string The name of the winning team.
     */
    function getWinningTeam() public view returns (string memory) {
        if (getHomeTeamScore() > getAwayTeamScore()) {
            return homeTeam;
        } else {
            return awayTeam;
        }
    }
}

/**
 * @title BasketballGame
 * @dev A contract that inherits from Game to manage a basketball game.
 */
contract BasketballGame is Game {
    uint256 homeTeamScore;
    uint256 awayTeamScore;

    /**
     * @dev Constructor to initialize the basketball game with home and away teams.
     * @param _homeTeam The name of the home team.
     * @param _awayTeam The name of the away team.
     */
    constructor(string memory _homeTeam, string memory _awayTeam)
        Game(_homeTeam, _awayTeam)
    {}

    /**
     * @dev Modifier to validate the score.
     * @param score The score to validate.
     */
    modifier validScore(uint256 score) {
        require(score >= 0 && score < 4, "Invalid score");
        _;
    }

    /**
     * @dev Gets the score of the home team.
     * @return uint256 The score of the home team.
     */
    function getHomeTeamScore() internal view override returns (uint256) {
        return homeTeamScore;
    }

    /**
     * @dev Gets the score of the away team.
     * @return uint256 The score of the away team.
     */
    function getAwayTeamScore() internal view override returns (uint256) {
        return awayTeamScore;
    }

    /**
     * @dev Updates the home team score.
     * @param score The score to add to the home team.
     */
    function homeTeamScored(uint256 score) external validScore(score) {
        homeTeamScore += score;
    }

    /**
     * @dev Updates the away team score.
     * @param score The score to add to the away team.
     */
    function awayTeamScored(uint256 score) external validScore(score) {
        awayTeamScore += score;
    }
}

/**
 * @title SoccerGame
 * @dev A contract that inherits from Game to manage a soccer game.
 */
contract SoccerGame is Game {
    uint256 homeTeamScore;
    uint256 awayTeamScore;

    /**
     * @dev Constructor to initialize the soccer game with home and away teams.
     * @param _homeTeam The name of the home team.
     * @param _awayTeam The name of the away team.
     */
    constructor(string memory _homeTeam, string memory _awayTeam)
        Game(_homeTeam, _awayTeam)
    {}

    /**
     * @dev Gets the score of the home team.
     * @return uint256 The score of the home team.
     */
    function getHomeTeamScore() internal view override returns (uint256) {
        return homeTeamScore;
    }

    /**
     * @dev Gets the score of the away team.
     * @return uint256 The score of the away team.
     */
    function getAwayTeamScore() internal view override returns (uint256) {
        return awayTeamScore;
    }

    /**
     * @dev Increments the home team score by 1.
     */
    function homeTeamScored() external {
        homeTeamScore++;
    }

    /**
     * @dev Increments the away team score by 1.
     */
    function awayTeamScored() external {
        awayTeamScore++;
    }
}
