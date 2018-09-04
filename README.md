# Takehome for QA engineer position.

## Task

We created a test school with a course that contains 4 lecture.
Your task is to write tests where you enroll in a course and complete it.
We've setup Rspec and Cucumber in this repo.
Feel free to choose one that fits you the best, or use any other e2e testing framework.


## Feature: Enrollment in a test course
  As an user of the system
  I want to enroll in and complete a test course
  So that I can learn the course material


## Setup

Install dependencies for watir/cucumber
```
gem install bundler
```

```
bundle install
```

## To Run
=> cucumber ENVIRONMENT="qa" BROWSER="chrome"

Example:
=> cucumber ENVIRONMENT="qa" BROWSER="chrome"
Using the default profile...
Feature: Enrollment in a test course
  As an user of the system
  I want to enroll in and complete a test course
  So that I can learn the course material

"Starting #<Cucumber::Core::Test::Case:0x00007ff7f3a67c80>"
  Scenario: The one where an user enrolls in a test course and completes it
    Given An user navigates to the teachable website
    And An user signs up for up for a new account
    When An user enrolls in a test course
    Then The user should complete the lectures to finish the test course

1 scenario (1 passed)
4 steps (4 passed)
0m43.420s

Test Results can also be found in the reports folder
