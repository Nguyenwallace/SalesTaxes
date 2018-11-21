module App
  #class Tax to handle all kinds of taxes
  class Tax
  	NormalRate=0.1	
  	SpecialRate =0.0		
  	def self.importCal(import)
  		if (import =="import")
  			0.05
  		else 
  			0.00
  		end
  	end
  end
end