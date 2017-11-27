
@desktop
Feature: Entidades colaboradoras pueden acceder

	Scenario: Entidad colaboradora accede correctamente
		Given the user is at the 'Login' page
		When the user access to entities
		Then the user is at the 'Entities' page
