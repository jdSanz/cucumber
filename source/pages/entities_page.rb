 

class Entities 

	include PageObject

	text_field(:username, :xpath => "//*[@name='username']")
	text_field(:password, :xpath => "//*[@name='password']")
	button(:login, )



end