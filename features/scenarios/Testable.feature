Feature: Enrollment in a test course

  As an user of the system
  I want to enroll in and complete a test course
  So that I can learn the course material

  Scenario: The one where an user enrolls in a test course and completes it
    Given An user navigates to the teachable website
    And   An user signs up for up for a new account
    When  An user enrolls in a test course
    Then  The user should complete the lectures to finish the test course
