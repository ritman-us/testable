require 'cucumber'
require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'webdriver-highlighter'
require 'data_magic'
require 'fig_newton'
require 'rspec'
World(PageObject::PageFactory)


#environment setup qa
def environment_name
  (ENV['ENVIRONMENT'] ||= 'qa').downcase.to_sym
end

#browser setup  #firefox, chrome
def browser_name
  (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
end

#setup for DataMagic
GEM_ROOT = File.expand_path("../..", __FILE__)
DataMagic.yml_directory = ("#{GEM_ROOT}/data/")
DataMagic.load('data.yml')

#setup for FigNewton
FigNewton.yml_directory = ("#{GEM_ROOT}/data/")
if environment_name == :qa || $env == 'qa'
  FigNewton.load('env_qa.yml')
end

#setup of page objects
def initialize_pageobjects
  @browser.driver.manage.delete_all_cookies
  HomePage.new(@browser)
  SignupPage.new(@browser)
  EnrollmentPage.new(@browser)
  CoursePage.new(@browser)
  LoginPage.new(@browser)
end

def initialize_browser(browser)
  if browser_name == :chrome || browser == 'chrome'
    @browser=Watir::Browser.new(:chrome, listener: WebDriverHighlighter.new)
    @browser.driver.manage.window.maximize
  end
end