When(/^the user is at the '(.*)' page$/) do |page|
	@current_page = nil
	case page
	when 'Register' then @current_page = RegisterPage.new @driver
	end
end