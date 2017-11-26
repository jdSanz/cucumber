class RegisterPage
	
	include PageObject

	button(:country_selector, :id => 'select2-university-country-container')
	text_field(:country, :class => 'select2-search__field')
	button(:country_select, :xpath => '//*[contains(@class, "select2-results__option--highlighted")]')
	button(:reset_formulary, :class => 'limpiar-campos')

	def initialize(driver)
		@driver = driver
	end

	def clear_fields(country)
		country_selector
		country country
		country_select
		
		sleep 5

		begin
			reset_formulary			
		rescue Exception => e
			reset_formulary
		end
	end

	def country_text
		country_selector_text
	end
end