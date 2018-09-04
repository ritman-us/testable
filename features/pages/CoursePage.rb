class CoursePage
  include PageObject
  include PageObject::PageFactory
  include DataMagic
  include RSpec::Matchers

  page_url "#{FigNewton.signup_url}courses/enrolled/"

  # Course Data
  link(:start_lecture, class:['btn btn-primary start-next-lecture'])
  link(:finish_lecture, id:'lecture_complete_button')
  link(:user_menu, class:['fedora-navbar-link navbar-link dropdown-toggle open-my-profile-dropdown'])
  link(:user_logout, href: '/sign_out')
  span(:current_percentage, class: ['percentage'])
  div(:progress_bar, class:['progressbar-fill'])
  div(:lecture1, class:['lecture-text-container'])
  div(:lecture2, id:'lecture-attachment-5516102')
  div(:lecture4, class:['lecture-text-container'])
  in_iframe(index: 0) do |frame|
    button(:next_page, class:['toolbarButton pageDown'], frame: frame)
  end

  def complete_test_course
    start_next_lecture
    finish_lecture_1
    finish_lecture_2
    finish_lecture_3
    finish_lecture_4
  end

  def start_next_lecture
    wait_for_browser
    start_lecture_element.wait_until(&:present?)
    start_lecture
  end

  def finish_lecture_1
    wait_for_browser
    lecture1_element.wait_until(&:present?)
    finish_lecture
    progress_bar_element.wait_until(&:present?)
    expect(@browser.span(class: ['percentage']).text).to eq "25%"
  end

  def finish_lecture_2
    wait_for_browser
    lecture2_element.wait_until(&:present?)
    finish_lecture
    progress_bar_element.wait_until(&:present?)
    expect(@browser.span(class: ['percentage']).text).to eq "50%"

  end

  def finish_lecture_3
    wait_for_browser
    next_page
    wait_for_browser
    finish_lecture
    progress_bar_element.wait_until(&:present?)
    expect(@browser.span(class: ['percentage']).text).to eq "75%"
  end

  def finish_lecture_4
    wait_for_browser
    lecture4_element.wait_until(&:present?)
    finish_lecture
    expect(@browser.span(class: ['percentage']).text).to eq "100%"
  end

  def sign_out
    user_menu
    user_logout
  end

end
