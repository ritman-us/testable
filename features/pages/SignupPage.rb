class SignupPage
  include PageObject
  include PageObject::PageFactory
  include DataMagic

  page_url "#{FigNewton.signup_url}/sign_up"

  # Create An Account
  text_field(:full_name, id: 'user_name')
  text_field(:email, id: 'user_email')
  text_field(:password, id: 'user_password')
  text_field(:confirm_password, id: 'user_password_confirmation')
  checkbox(:promotional_email, id: 'user_unsubscribe_from_marketing_emails')
  checkbox(:terms, id: 'user_agreed_to_terms')
  button(:sign_up, class: ['btn btn-primary btn-md signup-button'])
  link(:select_course, href: '/p/take-home-test')

  def create_new_account
    wait_for_browser
    sign_up_element.wait_until(&:present?)
    $timestamp = Time.now.strftime('%m%d%I%M%S')
    populate_page_with data_for :create_new_account
    extract_login_info
    sign_up_user
  end

  def extract_login_info
    $username = full_name
    $email = email
    $password = password
    #puts 'username created: ' + full_name
    #puts 'user email:' + email
  end

  def sign_up_user
    wait_for_browser
    sign_up
  end

end
