require 'rspec'
#require 'byebug'
require 'cucumber'
require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path = "./chromedriver"

Before do |scenario|
    @driver = Selenium::WebDriver.for(:chrome)
    @driver.get ENV["SITE"]
end

After do |scenario|
    
    if scenario.respond_to?('scenario_outline') then
        scenario = scenario.scenario_outline
    end

    if scenario.failed?
        last_tag = scenario.tags.last.name
        scenario_location = scenario.location.to_s.split('/').last
        file_name = "#{scenario_location}#{last_tag}#{Time.now.strftime('%y-%m-%d_%H:%M')}.png"
        file_path = File.expand_path(File.dirname(__FILE__) + "/../../report/#{$date}/images/" + file_name)
        @driver.screenshot(file_path)
    end
    
    @driver.quit
end

Before('@prueba') do

end



























=begin    
    @driver.driver_quit
=end


=begin
    ## Create global var $date with the actual date

    profile: >
    **
    --format html --out ./report/<%= $date %>/report.html
    --format json --out ./report/<%= $date %>/report.json

=end