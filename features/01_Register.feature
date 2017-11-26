Feature: Register

	Scenario: An user can clear the register formulary
		Given the user is at the 'Register' page
		When the user fill the formulary and clear the data
		Then the formulary has been reset

	