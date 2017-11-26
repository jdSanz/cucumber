class Wait
	def self.wait_for(timeout=10)
		wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
		wait.until { yield }
	end
end


module PageObject
	
	#include RSpec::Matchers
	
	def self.included(cls)
		cls.extend ClassMethods
	end

	module ClassMethods

		def button(name, identifier)

			element_actions(name, identifier)

			define_method(name) do
				Wait.wait_for(10){ @driver.find_element(identifier).displayed? }
				@driver.find_element(identifier).click
			end
		end

		def text_field(name, identifier)

			element_actions(name, identifier)

			define_method(name) do |text, clear = false|
				Wait.wait_for(10){ @driver.find_element(identifier).displayed? }
				element = @driver.find_element(identifier)
				element.clear if clear
				element.send_keys(text)
			end
		end

		def text(name, identifier)

			element_actions(name, identifier)
		end

		#------------------------------------------------------
		#----------------------- ALL ELEMENTS HAVE THIS METHODS

		def element_actions(name, identifier)

			define_method("#{name}_present?") do |timeout=10|
				begin
    				Wait.wait_for(timeout){ @driver.find_element(identifier) }
			        return true
			    rescue Exception => error
			        return false
			    end
			end

			define_method("#{name}_text") do
				Wait.wait_for(10){ @driver.find_element(identifier).displayed? }
				return @driver.find_element(identifier).text
			end
		end
	end
end