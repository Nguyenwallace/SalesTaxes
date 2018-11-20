#class Tax to handle all kinds of taxes
class Tax
	def self.normalRate
		0.10
	end
	def self.specialRate
		0.00
	end
	def self.importCal(import)
		if (import =="import")
			0.05
		else 
			0.00
		end
	end
end