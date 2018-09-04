
Given(/^An user navigates to the teachable website$/) do
  visit HomePage
end

And(/^An user signs up for up for a new account$/) do
  on(HomePage).open_new_account
  on(SignupPage).create_new_account
end

When(/^An user enrolls in a test course$/) do
  on(SignupPage).select_course
  on(EnrollmentPage).enroll_into_course
  on(EnrollmentPage).continue_to_course
end

Then(/^The user should complete the lectures to finish the test course$/) do
  on(CoursePage).complete_test_course
  on(CoursePage).sign_out
  close_browser
end


