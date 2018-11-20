#Super class ProductLine 
class ProductLine
	attr_accessor :category, :title, :quantity, :price, :import
	def initialize (category, title, quantity, price, import)
		@category = category
		@title = title
		@quantity = quantity
		@price = price
		@import= import		 
	end
	def importRate 
		Tax.importCal(@import)
	end
	#generate items depends on category (food, medical, book are special, others are normal)
	def self.generate(category, title, quantity, price, import)
		if (category == "book" || category == "medical" || category == "food")
			 SpecialProductLine.new(category, title, quantity, price, import)
		else 
			 NormalProductLine.new(category, title, quantity, price, import)
		end		
	end
end

require './normalProductLine'
require './specialProductLine'
require './tax'