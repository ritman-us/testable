class EnrollmentPage
  include PageObject
  include PageObject::PageFactory
  include DataMagic

  page_url "#{FigNewton.base_url}/p/take-home-test"

  #enroll data
  button(:enroll_course, id:'enroll-button-top')
  link(:continue_course, class:['btn btn-hg btn-primary btn-inline-block goto-course'])


  def enroll_into_course
    wait_for_browser
    enroll_course_element.wait_until(&:present?)
    enroll_course
  end

  def continue_to_course
    wait_for_browser
    continue_course_element.wait_until(&:present?)
    continue_course
  end

end