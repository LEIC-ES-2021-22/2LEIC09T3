Feature: Use the uni app to open a map that indicates the location of the Student's next class

    Scenario: Student taps on the location button on a class widget
       Given the user is logged in to uni
       Given I open the drawer
       When the user taps on the room name on a class widget
       Then a screen for seeing where that classroom is located should be shown to the user

    Scenario: Student swipes and sees the room's zoomed location
        Given the user is logged in to uni
        Given I open the drawer
        And the user is on the room page
        When the user swipes to the right
        Then a screen for seeing that classrooms zoomed location should be shown to the user
