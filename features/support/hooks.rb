Before do
  page.current_window.resize_to(1270, 768)
  Capybara.visit Capybara.app_host
  p Time.now
end

After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%H_%M_%S")
    sleep 5
    width = page.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
    height = page.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")
    page.current_window.resize_to(width, height)
    embed("data:image/png;base64,#{Capybara.current_session.driver.browser.screenshot_as(:base64)}", 'image/png', 'Failure')
    name = "#{scenario.name.downcase.gsub(' ', '_')}_#{time}.png"
    page.save_screenshot("screenshots/#{name}")
    p "Screenshot raised - " + "screenshots/#{name}"
  end

  home_page.sign_out_the_user
end

at_exit do

end

