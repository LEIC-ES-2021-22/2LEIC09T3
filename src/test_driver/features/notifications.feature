Feature: Receive SIGARRA's notifications on the uni app

    Scenario: Student has pending notifications
       Given the user is logged in to uni
       And the user has unread notifications
       Then a badge on the notifications button is displayed

    Scenario: Student wants to see pending notifications
        Given the user is logged in to uni
        When the user taps the "notifications" button
        Then a screen for seeing their notifications should be shown to the user
        
    Scenario: Student taps on pending notification
        Given the user is logged in to uni
        And the user is on the notifications screen
        And the user has unread notifications
        When the user slides a notification to the right and taps on "Marcar como lida"
        Then the notification is marked as read

    Scenario: Student deletes notification
        Given the user is logged in to uni
        And the user is on the notifications screen
        And there are notifications
        When the user swipes a notification to the left and taps the delete button
        Then the notification is deleted from uni