class LoginPage
  include PageObject

  page_url "#{FigNewton.base_url}/secure/136655/users/sign_in"

  # Homepage fields
  text_field(:email, id: 'user_email')
  text_field(:password, id: 'user_password')
  button(:login, class: ['btn btn-primary btn-md login-button'])
  link(:select_course, href:'/courses/enrolled/188336')

  def login_user (email,password)
    self.email = email
    self.password = password
    login
    select_course
  end

end