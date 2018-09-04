class HomePage
  include PageObject
  include PageObject::PageFactory

  page_url "#{FigNewton.base_url}"

  # Homepage fields
  link(:select_course, href: '/p/take-home-test')
  link(:sign_up, href: '/sign_up')
  link(:sign_in, href: '/sign_in')
  h2(:enroll_now, class: ['headline'])

  def login
    wait_for_browser
    sign_in
  end

  def open_new_account
    wait_for_browser
    enroll_now_element.wait_until(&:present?)
    sign_up
  end

end
