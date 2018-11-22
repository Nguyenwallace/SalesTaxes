require './product'
module App
  #Super class ProductLine 
  class ProductLine < Product
  	attr_accessor :category, :title, :quantity, :price, :import
  	def initialize (category, title, quantity, price, import)
      super(category, title, price, import)
  		@quantity = quantity	 
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
end 

require './normalProductLine'
require './specialProductLine'
require './tax'