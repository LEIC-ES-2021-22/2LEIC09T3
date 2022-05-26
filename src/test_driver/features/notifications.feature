Feature: Receive SIGARRA's notifications on the uni app

    Scenario: Student has pending notifications
        Given the user is logged in to uni
        And the user has unread notifications
        Then a badge on the "Notifications" button is displayed

    # Scenario: Student wants to see pending notifications
    #     Given the Student is logged in to uni
    #     When the Student taps the "Notifications" button
    #     Then a screen for seeing their notifications should be shown to the Student
        
    # Scenario: Student taps on pending notification
    #     Given the Student is logged in to uni
    #     And the Student is on the "Notifications" screen
    #     And there are unseen notifications
    #     When the Student taps on an unseen notification
    #     Then the notification is marked as "seen".

    # Scenario: Student deletes notification
    #     Given the Student is logged in to uni
    #     And the Student is on the "Notifications" screen
    #     And there are notifications
    #     When the Student swipes a notification to the left
    #     Then the notification is deleted from uni
    #     And SIGARRA is notified that the notification was dismissed 