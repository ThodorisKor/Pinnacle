# ADISE22_PINNACLE

Pinnacle παιχνίδι 2 ατόμων μέσα απο τον browser. 

[![English](https://img.shields.io/badge/language-English-blue)](README.md)
[![Ελληνικά](https://img.shields.io/badge/language-%CE%95%CE%BB%CE%BB%CE%B7%CE%BD%CE%B9%CE%BA%CE%AC-green)](README_GR.md)

## Demo game

 - Mπορείτε να βρείτε το demo στο link -> https://users.iee.ihu.gr/~it185430/ADISE22_PINNACLE/www/index.html

Table of Contents
=================
   * [Εγκατάσταση](#εγκατάσταση)
      * [Απαιτήσεις](#απαιτήσεις)
      * [Οδηγίες Εγκατάστασης](#οδηγίες-εγκατάστασης)
   * [Περιγραφή API](#περιγραφή-api)
      * [Methods](#methods)
         * [Deck](#deck)
            * [Αρχικοποίηση Deck](#αρχικοποίηση-deck)
            * [Ανάγνωση Deck](#ανάγνωση-deck)
         * [Player](#player)
            * [Ανάγνωση στοιχείων παίκτη](#ανάγνωση-στοιχείων-παίκτη)
         * [Status](#status)
            * [Ανάγνωση κατάστασης παιχνιδιού](#ανάγνωση-κατάστασης-παιχνιδιού)
         * [Center Card](#center-card)
            * [Αλλαγή κάρτας που υπάρχει στο κέντρο](#αλλαγή-κάρτας-που-υπάρχει-στο-κέντρο)
            * [Ανάγνωση κάρτας που υπάρχει στο κέντρο](#ανάγνωση-κάρτας-που-υπάρχει-στο-κέντρο)
         * [Clean Center](#clean-center)
            * [Καθαρισμός κάρτας κέντρου](#καθαρισμός-κάρτας-κέντρου)
         * [Give Card](#give-card)
            * [Καθορισμός νέας κάρτας παίκτη](#καθορισμός-νέας-κάρτας-παίκτη)
         * [Play Card](#play-card)
            * [Μεταβολή κάρτας κέντρου](#μεταβολή-κάρτας-κέντρου)
         * [Move](#move)
            * [Παίξιμο-Υποβολή συνδυασμού](#παίξιμο-υποβολή-συνδυασμού)
      * [Entities](#entities)
         * [Deck](#deck-1)
         * [Player](#player)
         * [Game_status](#game_status)


### :hammer_and_wrench: Languages and Tools Used for this project :

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

# Εγκατάσταση

## Απαιτήσεις

-  Apache2  

-  Mysql Server

-  php 

## Οδηγίες Εγκατάστασης

- Clone the game

```
$ git clone https://github.com/iee-ihu-gr-course1941/ADISE22_PINNACLE.git
```

- Βεβαιωθείτε ότι ο φάκελος είναι προσβάσιμος από τον Apache Server. πιθανόν να χρειαστεί να καθορίσετε τις παρακάτω ρυθμίσεις.

- Θα πρέπει να δημιουργήσετε στην Mysql την βάση με όνομα 'pinnacle' και να φορτώσετε σε αυτήν την βάση τα δεδομένα από το αρχείο schema.sql

- Θα πρέπει να φτιάξετε το αρχείο lib/config_local.php το οποίο να περιέχει:

```
    <?php
	$DB_PASS = 'κωδικός';
	$DB_USER = 'όνομα χρήστη';
    ?>
```

# Περιγραφή Παιχνιδιού

## Το Pinnacle παιζεται ως Εξής : 

- Αρχικά μοιράζονται και στους 2 παίκτες απο 12 φύλλα της τράπουλας.

- Κάθε παίκτης σκοπό έχει να δημιουργήσει 3άδες 4άδες κτλ από τα ίδια φύλλα και να τα κατεβάσει κάτω. Για παράδειγμα , εάν ένας παίκτης έχει 3 φύλλα του 9(π.χ. 9 diamonds , 9 spades και 9 clubs) μπορεί να τα κατεβάσει απο το χέρι του κάτω στους συνδυασμούς  του. Επίσης , εκτός απο συνδυασμούς ίδιου τύπου , ο παίκτης μπορεί να κάνει και κέντες ανάλογου τύπου. Κέντα είναι όταν υπάρχουν στην σειρά αριθμητικά φύλλα ίδιας φυγούρας. Για παράδειγμα 2,3,4,5,6 ίδιας φυγούρας φύλλου. Τέλος , βασικός στόχος κάθε παίκτη είναι να μείνει με κανένα φύλλο στο χέρι , και να έχει τους περισσότερους συνδυασμούς.

- ### Οι κανόνες είναι :   
    1. ο παίκτης μπορεί να παίξει μόνο εάν είναι η σείρα του.
    
    2. ο παίκτης αρχικά μπορεί να τραβήξει ένα φύλλο από την τράπουλα αν επιθυμεί και στην συνέχεια εάν έχει δημιουργήσει έναν συνδυασμό , να τον κατεβάσει και τέλος να παίξει ενα χαρτί στο κέντρο για να τελειώσει την σειρά του. 

- ### Η βάση μας Κρατάει τους εξής πίνακες και στοιχεία :
    - **Πίνακες που περιέχονται στην Βάση :**  
        > ο πίνακας Players περιέχει τα στοιχεία των παικτών.
        
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
        </tr></table>

        > ο πίνακας game_status περιέχει στοιχεία για την σειρά παίκτη που παίζει , σε τι status βρίσκεται το game και το result.

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

        > ο πίνακας deck_empty περιέχει τα στοιχεία όλης της τράπουλας με όλα τα χαρτιά αρχικοποιημένα σε θέση(location) NULL.
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

        > ο πίνακας deck περιέχει τα στοιχεία όλης της τράπουλας αλλά με τις θέσεις(location) τροποποιημένες αναλόγως το παιχνίδι που εξελίσσεται.
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
        
- ### Η εφαρμογή απαπτύχθηκε μέχρι το σημείο όπου :   
   - Ο παίκτης μπορεί να παίξει ένα φύλλο στο κέντρο.
   - Να τραβήξει ένα φύλλο από την τράπουλα.
   - Να παίξει συνδυασμούς.
- ### Δεν υλοποιήθηκε :
   - Ο παίκτης να παίρνει ένα φύλλο από το κέντρο.
   - Ο παίκτης να κολλάει φύλλα στους ήδη υπάρχοντες συνδυασμούς του.
   - Το score των παικτών.
   - Πολλαπλοί γύροι παιχνιδιού. 
# Συντελεστές 

Ομάδα 2 ατόμων : 

1.  **Βασίλης Δραμιτινός**
2.  **Θοδωρής Κορδατζάκης**

Aρμοδιότητες ομάδας :

- **Βασίλης Δραμιτινός** : Σχεδιασμός mysql , Υλοποίηση Βάσης , Υλοποίηση sql procedures , Υλοποίηση php API ,  JQuery , javascript.

- **Θοδωρής Κορδατζάκης** : Υλοποίηση html Page , Υλοποίηση php API , Bootstrap , javascript , JQuery , debugging , Υλοποίηση sql procedures.
        


# Περιγραφή API

## Methods

### Deck

#### **Αρχικοποίηση Deck**

```
POST /deck/
```
Αρχικοποιεί το deck με θέσεις NULL. Δηλαδή γίνεται reset η τράπουλα. Επιστρέφει ολα τα στοιχεία του πίνακα deck.

#### **Ανάγνωση Deck**

```
GET /deck/:x/
```
Επιστρέφει τα φύλλα του παίκτη x.

- Json data :

    | Field             | Description                    | 
    | ----------------- | ------------------------------ | 
    | `number`          | το number φύλλου του παίκτη x. |
    | `shape`           | το shape φύλλου του παίκτη x.  |


### Player

#### **Ανάγνωση στοιχείων παίκτη**

```
GET /player/:p
```
Επιστρέφει τα στοιχεία του παίκτη p ή αν παραληφθεί εμφανίζεται error message.Το p μπορεί να είναι 1 ή 2.

- Json data :

    | Field               | Description                    | 
    | ------------------- | ------------------------------ | 
    | `username`          | το username του παίκτη p.      |
    | `id`                | το id του παίκτη p.            |

#### **Επαναφορά Κατάστασης παιχνιδιού και παικτών**

```
POST /player/
```
Επαναφέρει την κατασταση παιχνιδιού σε NULL και επίσης επαναφέρει τους παίκτες(τα 'username' τους) σε NULL.

#### **Αρχικοποίηση παίκτη**

```
PUT /player/:p
```

Αρχικοποιεί έναν παίκτη p ή εαν παραληφθεί εμφανίζεται error message. To p μπορεί να ειναι 1 ή 2. Επιστρέφει ολα τα στοιχεία του p. Εάν έχει μπει ένας παίκτης το game_status γίνεται 'initialized' , εάν έχουν μπει 2 παίκτης γίνεται 'started' και εάν δεν υπάρχουν παίκτες είναι 'not active'. 

- Json data :

    | Field               | Description                                                    | 
    | ------------------- | -------------------------------------------------------------- | 
    | `username`          | το username του παίκτη p.                                      |
    | `id`                | το id του παίκτη p.                                            |    
    | `token`             | To κρυφό token του παίκτη p.
    | `last action`       | η τελευταία χρονική στιγμή που έκανε μια ενέργεια ο παίκτης p. |

### Status

#### **Ανάγνωση κατάστασης παιχνιδιού**

```
GET /status/
```
Επιστρέφει όλα τα στοιχεία του πίνακα game_status.

#### **Καθορισμός αποτελέσματος παιχνιδιού**

```
POST /status/
```
Καθορίζει το το αποτέλεσμα του παιχνιδιού , ανάλογα το τελευταίο φύλλο που θα παιχτεί απο κάποιον παίκτη.

### Center Card

#### **Αλλαγή κάρτας που υπάρχει στο κέντρο**

```
GET /center/
```
Αλλάζει μια τυχαία κάρτα που υπάρχει στον πίκανα deck σε 'location' = center και επιστρέφει το 'number' και το 'shape' της κάρτας αυτής.

- Json data :

    | Field               | Description                     | 
    | ------------------- | ------------------------------- | 
    | `number`            | το number με location='center'. |
    | `shape`             | το shape με location='center'.  |

#### **Ανάγνωση κάρτας που υπάρχει στο κέντρο**

```
POST /center/
```
Επιστρέφει την κάρτα που υπάρχει στον πίνακα deck σε 'location' = center.

- Json data :

    | Field               | Description                     | 
    | ------------------- | ------------------------------- | 
    | `number`            | το number με location='center'. |
    | `shape`             | το shape με location='center'.  |

### Clean Center

#### **Καθαρισμός κάρτας κέντρου** 

```
POST /clean_center/
```
Αλλαγή υπάρχων κάρτας που υπάρχει στο κέντρο σε NULL.

### Give Card

#### **Καθορισμός νέας κάρτας παίκτη**

```
POST /give_card/
```
Προσθήκη μιας τυχαίας κάρτας απο 'location'=pile , στο χέρι του παίκτη.

### Play Card

#### **Μεταβολή κάρτας κέντρου** 

```
PUT /playcard/:n/:s/
```

Μεταβάλλει την επιλεγμένη κάρτα παίκτη σε 'location'=center.

### Move

#### **Παίξιμο-Υποβολή συνδυασμού**

```
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/
or 
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/:n4/:s4/
or
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/:n4/:s4/:n5/:s5
or 
PUT /move/:n1/:s1/:n2/:s2/:n3/:s3/:n4/:s4/:n5/:s5/:n6/:s6
```
Υποβάλλει έναν συνδυασμο απο τους παραπάνω επιτρεπτούς συνδυασμούς , δηλαδή απο 3 έως 6 φύλλα(n(i),s(i) αντιπροσωπεύει ένα φύλλο). Επιστρέφει όλα τα στοιχεία φύλλων που μόλις υποβλήθηκαν για συνδυασμό.

- Json data :

    | Field             | Description                    | 
    | ----------------- | ------------------------------ | 
    | `number`          | το number φύλλου n(i).         |
    | `shape`           | το shape φύλλου s(i).          |
    | `location`        | το location είτε "triada combination ".$turn['p_turn']"(με $turn του παίκτη που έκανε τον συνδυασμό) ή "kenta combination ".$turn['p_turn']"(με $turn του παίκτη που έκανε τον συνδυασμό). |

## Entities

### Deck
---------

Το deck είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:

| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `number`                 | H συντεταγμένη αριθμός του φύλλου            | 1..10,J,Q,K,A                       |
| `shape`                  | H συντεταγμένη σχήμα του φύλλου              | String                              |
| `location`               | Η θέση του φύλλου                            | String                              |

### Player
---------

O κάθε παίκτης έχει τα παρακάτω στοιχεία:

| Attribute                | Description                                                 | Values                              |
| ------------------------ | ----------------------------------------------------------- | ----------------------------------- |
| `username`               | όνομα παίκτη                                                | String                              |
| `id`                     | το id του παίκτη                                            | Int                                 |
| `token`                  | To κρυφό token του παίκτη                                   | String                              |
| `last action`            | η τελευταία χρονική στιγμή που έκανε μια ενέργεια ο παίκτης | TIMESTAMP                           |

### Game_Status
---------

H κατάσταση παιχνιδιού έχει τα παρακάτω στοιχεία:

| Attribute                | Description                                 | Values                                                    |
| ------------------------ | ------------------------------------------- | --------------------------------------------------------- |
| `status`                 | κατάσταση                                   |'not active', 'initialized', 'started', 'ended', 'aborded' |
| `p_turn`                 | το φύλλο που παίζει ο παίκτης               | 'player 1', 'player 2'                                    |
| `result`                 | To κρυφό token του παίκτη                   | 'player 1', 'player 2','draw'                             |
| `last_change`            | τελευταία χρονική στιγμλη έγινε μια ενέργεια | TIMESTAMP                               |
