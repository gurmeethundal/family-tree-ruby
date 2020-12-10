# Family Tree challenge

*   This project is created using ruby version `2.7.1p83`. 
    ```
    > ruby --version
      ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x64-mingw32]
    ```
*   It is created in plain ruby and there are no dependencies for its execution.
*   Initial data is loaded from a hash as it does not connects to any database.
*   It can be executed and tested with below command. Just replace `test_data.txt` file with your actual test file name. I have added a test_data.txt file for my own testing.
    ```
    > ruby main.rb test_data.txt
    ```
*   While coding, I have tested this project with `test.rb` file with below command. You can ignore this file. 
    ```
    > ruby test.rb
    ```
*   Initial data is loaded from file `family_history.rb`
*   Sample output from my console while testing this project. While printing family structure [M] and [F] are used to represent the gender and (C) and (S) is used to represent the child and spouse.
    Test1:
    ```
      > ruby main.rb test_data.txt
        CHILD_ADDED
        Dominique Minerva
        Victoire Dominique Louis
        PERSON_NOT_FOUND
        PERSON_NOT_FOUND
        CHILD_ADDITION_FAILED
        NONE
        Darcy Alice
    ```
    Test2:
    ```
    >ruby test.rb
    Started processing...
    Loading family tree data...
    Printing initial family tree...
    King Aurther [M](C), Queen Margret [F](S)
    └──Bill [M](C), Flora [F](S)
    │  └──Victoire [F](C), Ted [M](S)
    │  │  └──Remus [M](C)
    │  └──Dominique [F](C)
    │  └──Louis [M](C)
    └──Charlie [M](C)
    └──Percey [M](C), Audrey [F](S)
    │  └──Moly [F](C)
    │  └──Lucy [F](C)
    └──Ronald [M](C), Helen [F](S)
    │  └──Rose [F](C), Malfoy [M](S)
    │  │  └──Draco [M](C)
    │  │  └──Aster [F](C)
    │  └──Hugo [M](C)
    └──Ginerva [F](C), Harry [M](S)
      └──James [M](C), Darcy [F](S)
      │  └──William [M](C)
      └──Albus [M](C), Alice [F](S)
      │  └──Ron [M](C)
      │  └──Ginny [F](C)
      └──Lily [F](C)
    ADD_CHILD 'Flora' 'Minerva' 'female' => CHILD_ADDED
    Family tree after adding new child
    King Aurther [M](C), Queen Margret [F](S)
    └──Bill [M](C), Flora [F](S)
    │  └──Victoire [F](C), Ted [M](S)
    │  │  └──Remus [M](C)
    │  └──Dominique [F](C)
    │  └──Louis [M](C)
    │  └──Minerva [F](C)
    └──Charlie [M](C)
    └──Percey [M](C), Audrey [F](S)
    │  └──Moly [F](C)
    │  └──Lucy [F](C)
    └──Ronald [M](C), Helen [F](S)
    │  └──Rose [F](C), Malfoy [M](S)
    │  │  └──Draco [M](C)
    │  │  └──Aster [F](C)
    │  └──Hugo [M](C)
    └──Ginerva [F](C), Harry [M](S)
      └──James [M](C), Darcy [F](S)
      │  └──William [M](C)
      └──Albus [M](C), Alice [F](S)
      │  └──Ron [M](C)
      │  └──Ginny [F](C)
      └──Lily [F](C)
    GET_RELATIONSHIP 'King Aurther' 'sons' => Bill Charlie Percey Ronald
    GET_RELATIONSHIP 'King Aurther' 'daughter' => Ginerva
    GET_RELATIONSHIP 'Bill' 'sons' => Louis
    GET_RELATIONSHIP 'Bill' 'daughters' => Victoire Dominique Minerva
    GET_RELATIONSHIP 'King Aurther' 'siblings' => NONE
    GET_RELATIONSHIP 'Ronald' 'siblings' => Bill Charlie Percey Ginerva
    GET_RELATIONSHIP 'Harry' 'siblings' => NONE
    GET_RELATIONSHIP 'Moly' 'siblings' => Lucy
    GET_RELATIONSHIP 'Ted' 'siblings' => NONE
    GET_RELATIONSHIP 'Victoire' 'siblings' => Dominique Louis Minerva
    GET_RELATIONSHIP 'Gurmeet' 'siblings' => PERSON_NOT_FOUND
    GET_RELATIONSHIP 'Audrey' 'brother_in_law' => Bill Charlie Ronald
    GET_RELATIONSHIP 'Ted' 'brother_in_law' => Louis
    GET_RELATIONSHIP 'Ronald' 'brother_in_law' => Harry
    GET_RELATIONSHIP 'Ginerva' 'sister_in_law' => Flora Audrey Helen
    GET_RELATIONSHIP 'Louis' 'sister_in_law' => NONE
    GET_RELATIONSHIP 'Lily' 'sister_in_law' => Darcy Alice
    GET_RELATIONSHIP 'Remus' 'maternal_aunt' => Dominique Minerva
    GET_RELATIONSHIP 'Victoire' 'maternal_aunt' => NONE
    GET_RELATIONSHIP 'William' 'maternal_aunt' => NONE
    GET_RELATIONSHIP 'Remus' 'paternal_aunt' => NONE
    GET_RELATIONSHIP 'Victoire' 'paternal_aunt' => Ginerva
    GET_RELATIONSHIP 'William' 'paternal_aunt' => Lily
    GET_RELATIONSHIP 'Remus' 'maternal_uncle' => Louis
    GET_RELATIONSHIP 'Victoire' 'maternal_uncle' => NONE
    GET_RELATIONSHIP 'William' 'maternal_uncle' => NONE
    GET_RELATIONSHIP 'Remus' 'paternal_uncle' => NONE
    GET_RELATIONSHIP 'Victoire' 'paternal_uncle' => Charlie Percey Ronald
    GET_RELATIONSHIP 'William' 'paternal_uncle' => Albus
    ```
