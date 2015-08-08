Feature: creating and maintaining invoices
  As an application user,
  In order to be able invoice my clients,
  I would like be able to access a web based interface to create, read, update and delete invoices

  Background:
    Given I'm logged in as an user

  Scenario: Create an invoice
    Given I am on the "home" page
    Then I should see "Create new invoice"
    And I fill in "invoice_recipient" with "Thomas Ochman"
    And I select "SEK" from "invoice_currency"
    And I click "New invoice"
    Then I should be o
    #Then show me the page

  Scenario: Access (read) an invoice


  Scenario: Update an invoice


  Scenario: Delete an invoice

