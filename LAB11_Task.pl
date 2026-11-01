% Declare the dynamic predicate to allow runtime database manipulation
:- dynamic letter/1.

% Initial set of letters
init_letters :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)).

% Start the game interface
start :-
    init_letters,
    menu.

% Main menu display and user interaction
menu :-
    nl,
    write('Hi This is the "Name Game"'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice...'), nl,
    read(Choice),
    handle_choice(Choice).

% Option 1: Display current letters
handle_choice(1) :-
    nl, write('--- Current Letters ---'), nl,
    (   letter(L),
        writeln(L),
        fail
    ;   true
    ),
    menu.

% Option 2: Add a letter (using standard assert/assertz)
handle_choice(2) :-
    write('Enter the letter to add: '),
    read(L),
    assert(letter(L)),
    write('Letter added successfully.'), nl,
    menu.

% Option 3: Add a letter at the top (using asserta)
handle_choice(3) :-
    write('Enter the letter to add at the top: '),
    read(L),
    asserta(letter(L)),
    write('Letter added at the top successfully.'), nl,
    menu.

% Option 4: Add a letter at the bottom (using assertz)
handle_choice(4) :-
    write('Enter the letter to add at the bottom: '),
    read(L),
    assertz(letter(L)),
    write('Letter added at the bottom successfully.'), nl,
    menu.

% Option 5: Delete a specific letter (using retract)
handle_choice(5) :-
    write('Enter the letter to delete: '),
    read(L),
    (   retract(letter(L))
    ->  write('Letter deleted successfully.')
    ;   write('Letter not found.')
    ),
    nl,
    menu.

% Option 6: Delete all letters (using retractall)
handle_choice(6) :-
    retractall(letter(_)),
    write('All letters have been deleted.'), nl,
    menu.

% Option 7: Exit the game
handle_choice(7) :-
    write('Exiting Name Game. Goodbye!'), nl.

% Handle invalid choices
handle_choice(_) :-
    write('Invalid choice, please try again.'), nl,
    menu.
















