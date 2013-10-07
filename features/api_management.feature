Feature: Api Management
    In order to use GBS
    As a user
    I need to be able to input and manage my Eve API Keys

    Background:
        Given I am on "/login"
        And I have logged in with username "demo" and password "demo"

    Scenario: Forgetting to give a keyID
        Given I am on "/api/new"
        When I fill in the following:
            | vCode | beefbeefbeefbeefbeefbeef | 
            | Label | Where's The Beef         |
        And I press "Add Key"
        Then I should be on "/api/new"
        And I should see "You did not enter a keyID"

    Scenario: Giving a non-numeric keyID
        Given I am on "/api/new"
        When I fill in the following:
            | keyID | thisisnotnumeric         |
            | vCode | beefbeefbeefbeefbeefbeef | 
            | Label | Where's The Beef         |
        And I press "Add Key"
        Then I should be on "/api/new"
        And I should see "keyID is not in a valid format"

    Scenario: Forgetting to give a vCode
        Given I am on "/api/new"
        When I fill in the following:
            | keyID | 8675309                  |
            | Label | Where's The Beef         |
        And I press "Add Key" 
        Then I should be on "/api/new"
        And I should see "You did not enter a vCode"

    Scenario: Giving a non-alphanumeric vCode
        Given I am on "/api/new"
        When I fill in the following:
            | keyID | 8675309                  |
            | vCode | ***************fbeefbeef | 
            | Label | Where's The Beef         |
        And I press "Add Key"
        Then I should be on "/api/new"
        And I should see "vCode is not in a valid format"

    Scenario: Giving a name which is too long
        Given I am on "/api/new"
        When I fill in the following:
            | keyID | 8675309                  |
            | vCode | beefbeefbeefbeefbeefbeef | 
        And I fill in 250 characters of nonsense for "Label"
        And I press "Add Key"
        Then I should be on "/api/new"
        And I should see "Key name is too long"

    Scenario: Successfully adding a key
        Given I am on "/api/new"
        When I fill in the following:
            | keyID | 8675309                  |
            | vCode | beefbeefbeefbeefbeefbeef | 
            | Label | Where's The Beef         |
        And I press "Add Key"
        Then I should be on "/api/new"
        And I should see "API key successfully added"

    Scenario: Editing a key
        Given I am on "/api/8675309"
        When I fill in the following:
            | Label | Where's the Pork |
        And I press "Edit Key"
        Then I should be on "/api/8675309"
        And I should see "API key successfully edited"
        And I should see "Pork"

    Scenario: Deleting a key
        Given I am on "/api/8675309"
        When I follow "Delete Key"
        Then I should be on "/api"
        And I should see "API key successfully deleted"
