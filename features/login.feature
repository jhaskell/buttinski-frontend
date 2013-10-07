Feature: User login
    In order to use Galactic Buttinski System
    As a user
    I need to be able to log in

    Scenario: Basic login
        Given I am on "/login"
        When I fill in the following:
            | Username | demo |
            | Password | demo |
        And I press "Login"
        Then I should be on "/"

