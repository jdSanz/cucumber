
When(/^the user fill the formulary and clear the data$/) do
	@current_page.clear_fields('ALEMANIA')
end

When(/^the formulary has been reset$/) do
	expect(@current_page.country_text).not_to eq 'ALEMANIA'
end