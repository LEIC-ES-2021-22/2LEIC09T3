Feature: Use the uni app to open a map that indicates the location of the Student's next class

    Scenario: Student taps on the location button on a class widget
       Given the user is logged in to uni
       When the user taps on the room name on a class widget
       Then a screen for seeing where that classroom is located should be shown to the user