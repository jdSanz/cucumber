
class LoginPage
	
	include PageObject

	button(:acceso_entidades_colaboradoras, :xpath => "//a[@href='/practicas/empresa/login']")

	def access_to_entidades
		acceso_entidades_colaboradoras
	end
end