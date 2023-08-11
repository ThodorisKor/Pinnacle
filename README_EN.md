# ADISE22_PINNACLE

Pinnacle 2-player game played through the browser.

[![English](https://img.shields.io/badge/language-English-blue)](README_EN.md)
[![Ελληνικά](https://img.shields.io/badge/language-%CE%95%CE%BB%CE%BB%CE%B7%CE%BD%CE%B9%CE%BA%CE%AC-green)](README.md)

## Demo game

- You can find the demo at the following link -> https://users.iee.ihu.gr/~it185430/ADISE22_PINNACLE/www/index.html

Table of Contents
=================
   * [Installation](#installation)
      * [Requirements](#requirements)
      * [Installation Instructions](#installation-instructions)
   * [API Description](#api-description)
      * [Methods](#methods)
         * [Deck](#deck)
            * [Initialize Deck](#initialize-deck)
            * [Read Deck](#read-deck)
         * [Player](#player)
            * [Read Player Details](#read-player-details)
         * [Status](#status)
            * [Read Game Status](#read-game-status)
         * [Center Card](#center-card)
            * [Change Center Card](#change-center-card)
            * [Read Center Card](#read-center-card)
         * [Clean Center](#clean-center)
            * [Clear Center Card](#clear-center-card)
         * [Give Card](#give-card)
            * [Set New Player Card](#set-new-player-card)
         * [Play Card](#play-card)
            * [Modify Center Card](#modify-center-card)
         * [Move](#move)
            * [Play-Submit Combination](#play-submit-combination)
      * [Entities](#entities)
         * [Deck](#deck-1)
         * [Player](#player)
         * [Game Status](#game_status)


### :hammer_and_wrench: Languages and Tools Used for This Project :

  <img src="https://github.com/devicons/devicon/blob/master/icons/php/php-original.svg" title="php" alt="php" width="40" height="40"/>&nbsp;&nbsp;
  <img src="https://github.com/devicons/devicon/blob/master/icons/mysql/mysql-original-wordmark.svg" title="mysql" alt="mysql" width="40" height="40"/>&nbsp;&nbsp;
   <img src="https://github.com/devicons/devicon/blob/master/icons/jquery/jquery-original-wordmark.svg" title="jquery" alt="jquery" width="40" height="40"/>&nbsp;&nbsp;
   <img src="https://github.com/devicons/devicon/blob/master/icons/javascript/javascript-original.svg" title="javascript" alt="javascript" width="40" height="40"/>&nbsp;&nbsp;
   <img src="https://github.com/devicons/devicon/blob/master/icons/html5/html5-original-wordmark.svg" title="html5" alt="html5" width="40" height="40"/>&nbsp;&nbsp;
   <img src="https://github.com/devicons/devicon/blob/master/icons/css3/css3-original-wordmark.svg" title="css3" alt="css3" width="40" height="40"/>&nbsp;&nbsp;
    <img src="https://github.com/devicons/devicon/blob/master/icons/bootstrap/bootstrap-original-wordmark.svg" title="bootstrap" alt="bootstrap" width="40" height="40"/>&nbsp;&nbsp;
    <img src="https://github.com/devicons/devicon/blob/master/icons/git/git-original-wordmark.svg" title="git" alt="git" width="40" height="40"/>&nbsp;&nbsp;
    <img src="https://github.com/devicons/devicon/blob/master/icons/github/github-original-wordmark.svg" title="github" alt="github" width="40" height="40"/>&nbsp;&nbsp;
    <img src="https://github.com/devicons/devicon/blob/master/icons/vscode/vscode-original.svg" title="vscode" alt="vscode" width="40" height="40"/>&nbsp;&nbsp;
    
# Installation

## Requirements

- Apache2
- MySQL Server
- PHP

## Installation Instructions

- Clone the game

```
$ git clone https://github.com/iee-ihu-gr-course1941/ADISE22_PINNACLE.git
```

- Make sure the folder is accessible by the Apache Server. You may need to configure the following settings.

- You need to create a MySQL database named 'pinnacle' and load the data from the schema.sql file into it.

- Create the file lib/config_local.php with the following content:

```
    <?php
	$DB_PASS = 'κωδικός';
	$DB_USER = 'όνομα χρήστη';
    ?>
```
# Game Description

## Pinnacle Gameplay:

- Initially, 12 cards are dealt to each of the 2 players from the deck.

- Each player's goal is to create sets of 3 cards, 4 cards, etc., of the same rank and lay them down. For example, if a player has 3 cards of rank 9 (e.g., 9 diamonds, 9 spades, and 9 clubs), they can lay them down as combinations. Additionally, besides combinations of the same rank, a player can also create "kentas," which are sequences of consecutive cards of the same suit. For example, 2, 3, 4, 5, 6 of the same suit. Ultimately, each player aims to have no cards left in hand and to have the most combinations.

- ### The rules are:
    1. A player can only play if it's their turn.
    
    2. Initially, a player can draw a card from the deck if desired. Then, if they have created a combination, they can lay it down. Finally, they can play a card in the center to end their turn.

- ### Our database holds the following tables and elements:
 - **Tables included in the Database :**  
        > The Players table contains players' information.
   
   	<table>
        <tr>
        <th>Players</th>
        </tr>
        <tr>
        <td>

   	| username | id | token | last action
        |--|--|--|--|
        | VARCHAR | INT | VARCHAR | TIMESTAMP

   	</td>
        </tr>
   	</table>

   	> The 'game_status' table contains information about the player's turn, the status of the game, and the result.

   	<table>
        <tr>
   
   	<th>game_status</th>
        </tr>
        <tr>
        <td>

   	| status | p_turn | result | last_action
        |--|--|--|--|
        | ENUM | ENUM | ENUM | TIMESTAMP

   	</td>
        </tr></table>

   	> The 'deck_empty' table contains the elements of the entire deck with all cards initialized to a position (location) of NULL.
        <table>
        <tr>
        
   	<th>deck_empty</th>
        </tr>
        <tr>
        <td>

   	| number | shape | location
        |--|--|--|
        | ENUM | VARCHAR | VARCHAR 

   	</td>
        </tr></table>

   	> The 'deck' table contains the elements of the entire deck, but with the positions (locations) modified according to the progressing game.
        <table>
        <tr>
        
   	<th>deck</th>
        </tr>
        <tr>
        <td>

   	| number | shape | location
        |--|--|--|
        | ENUM | VARCHAR | VARCHAR 

   	</td>
        </tr></table>
   
- ### The application has been developed up to the point where:
   - The player can play a card in the center.
   - The player can draw a card from the deck.
   - The player can play combinations.

- ### Not implemented:
   - The player taking a card from the center.
   - The player melding cards into existing combinations.
   - Players' scores.
   - Multiple rounds of the game.
   
# Contributors

Team of 2 individuals:

1.  **Vasilis Dramitinos**
2.  **Thodoris Kordatzakis**

Team Responsibilities:

- **Vasilis Dramitinos** : MySQL Design , Database Implementation , Implementation of SQL Procedures , Implementation of PHP API , jQuery , Javascript
- **Thodoris Kordatzakis** : Implementation of HTML Pages , Implementation of PHP API , JavaScript ,jQuery , Debugging , Implementation of SQL Procedures , Bootstrap



# API Description

## Methods

### Deck

#### **Initialize Deck**

```
POST /deck/
```
Initializes the deck with NULL positions, essentially resetting the deck. Returns all elements of the deck table.

#### **Read Deck**

```
GET /deck/:x/
```
Returns the cards of player x.

- JSON data:

    | Field             | Description                 | 
    | ----------------- | --------------------------- | 
    | `number`          | player x's card number.     |
    | `shape`           | player x's card shape.      |


### Player

#### **Read Player Details**

```
GET /player/:p
```
Returns the details of player p or displays an error message if not provided. p can be 1 or 2.

- JSON data:

    | Field               | Description             | 
    | ------------------- | ----------------------- | 
    | `username`          | player p's username.    |
    | `id`                | player p's id.          |

#### **Reset Game State and Players**

```
POST /player/
```
Resets the game state to NULL and also resets the players (their 'username') to NULL.

#### **Initialize Player**

```
PUT /player/:p
```

Initializes a player p or displays an error message if not provided. p can be 1 or 2. Returns all details of p. If a player has entered, the game_status becomes 'initialized'; if two players have entered, it becomes 'started'; and if there are no players, it is 'not active'.

- Json data :

    | Field               | Description                                                    | 
    | ------------------- | -------------------------------------------------------------- | 
    | `username`          | το username του παίκτη p.                                      |
    | `id`                | το id του παίκτη p.                                            |    
    | `token`             | To κρυφό token του παίκτη p.
    | `last action`       | η τελευταία χρονική στιγμή που έκανε μια ενέργεια ο παίκτης p. |

### Status

#### **Read Game Status**

```
GET /status/
```
Returns all elements of the game_status table.

#### **Set Game Result**

```
POST /status/
```
Sets the game result based on the last card played by a player.

### Center Card

#### **Change Center Card**

```
GET /center/
```

Changes a random card in the deck table with 'location' = center and returns the 'number' and 'shape' of that card.

- Json data :

    | Field               | Description                     | 
    | ------------------- | ------------------------------- | 
    | `number`            | το number με location='center'. |
    | `shape`             | το shape με location='center'.  |

#### **Read Center Card**

```
POST /center/
```
Returns the card in the deck table with 'location' = center.

- Json data :

    | Field               | Description                     | 
    | ------------------- | ------------------------------- | 
    | `number`            | το number με location='center'. |
    | `shape`             | το shape με location='center'.  |

### Clean Center

#### **Clean Center Card** 

```
POST /clean_center/
```
Changes the existing center card to NULL.

### Give Card

#### **Assign New Player Card**

```
POST /give_card/
```
Adds a random card from 'location' = pile to the player's hand.

### Play Card

#### **Change Center Card** 

```
PUT /playcard/:n/:s/
```

Changes the selected player card to 'location' = center.

### Move

#### **Play-Submit Combination**

```
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/
or 
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/:n4/:s4/
or
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/:n4/:s4/:n5/:s5
or 
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/:n4/:s4/:n5/:s5/:n6/:s6
```
Submits a combination from the permitted combinations above, ranging from 3 to 6 cards (n(i),s(i) represents a card). Returns all card details that were just submitted for the combination.

- Json data :

    | Field             | Description                    | 
    | ----------------- | ------------------------------ | 
    | `number`          | το number φύλλου n(i).         |
    | `shape`           | το shape φύλλου s(i).          |
    | `location`        | το location είτε "triada combination ".$turn['p_turn']"(με $turn του παίκτη που έκανε τον συνδυασμό) ή "kenta combination ".$turn['p_turn']"(με $turn του παίκτη που έκανε τον συνδυασμό). |

## Entities

### Deck
---------

The deck is an array, where each element has the following:

| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `number`                 | The numeric value of the card                | 1..10, J, Q, K, A                   |
| `shape`                  | The shape of the card                        | String                              |
| `location`               | The location of the card                     | String                              |

### Player
---------

Each player has the following attributes:

| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `username`               | Player's username                            | String                              |
| `id`                     | Player's id                                  | Int                                 |
| `token`                  | Player's hidden token                        | String                              |
| `last action`            | The timestamp of the player's last action    | TIMESTAMP                           |

### Game_Status
---------

The game status has the following attributes:

| Attribute                | Description                                  | Values                                                    |
| ------------------------ | -------------------------------------------- | --------------------------------------------------------- |
| `status`                 | The game status                              | 'not active', 'initialized', 'started', 'ended', 'aborted'|
| `p_turn`                 | The player currently playing                 | 'player 1', 'player 2'                                    |
| `result`                 | The result of the game                       | 'player 1', 'player 2', 'draw'                            |
| `last_change`            | Timestamp of the last action                 | TIMESTAMP                                                |

