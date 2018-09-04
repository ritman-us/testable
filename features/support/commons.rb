
def close_browser
  @browser.quit
end

def wait_for_browser
  begin
    @browser.wait
  rescue Exception=> e
    raise "Error: Browser took too long to finish loading page error: #{e.message}"
  end
end

def is_number?(variable)
  true if Float(variable)
rescue
  false
end

def verify_it(message)
  if yield
    puts "Verification PASSED for #{message}"
  else
    puts "Verification FAILED for #{message}"
    raise('Test Failure on verification')
  end
rescue => e
  puts "Verification FAILED for #{message} with exception '#{e}'"
  raise('Test Failure on verification')
end
