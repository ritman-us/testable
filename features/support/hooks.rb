Before do |scenario|
  #initialize the browser, page objects, and navigate to site
  begin
    p "Starting #{scenario}"
    initialize_browser('other')
    initialize_pageobjects
  rescue => e
    puts "Initialization FAILED with exception '#{e}'"
  end

end

After do |scenario|
  #Take a screenshot if failed scenario
  begin
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  rescue => e
    puts "Screenshot FAILED with exception '#{e}'"
  end

end
