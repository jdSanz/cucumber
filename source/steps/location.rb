When(/^the user is at the '(.*)' page$/) do |page|
	@current_page = nil
	case page
	when 'Register' then @current_page = RegisterPage.new @driver
	when 'Login' then @current_page = LoginPage.new @driver
	when 'Entities' then @current_page = EntitiesPage.new @driver
	end
end