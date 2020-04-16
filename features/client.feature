@client
Feature: Adding and Searching Client

  Background:
    Given I sign in to casebook


  Scenario: Adding a new client
    When I add new client with valid details
    Then I can see a success message

  @dependant_test
  Scenario: Adding a new client by selecting address
    When I add new client with valid details by selecting address
    Then I can see a success message

  @dependant_test
  Scenario: searching for a client added in previous test
    When I search for a client added in previous test
    Then I can see the client detail from previous test

  Scenario: Search for the new client added
    And I have created a new client
    When I search for the client
    Then I can see the client detail

  Scenario: search for client using advance search
    And search for following client
      | client_name | John    |
      | ref_id      | CL-1740 |
      | post_code   | ST1 1HL |
    Then I can see the client detail in the search result
