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
		if (@import =="import")
			Tax.importRate
		else 
			0.00
		end
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

#child class inherit ProductLine
class NormalProductLine < ProductLine
	def taxRate
		 Tax.normalRate
	end
end

#child class inherit ProductLine
class SpecialProductLine < ProductLine
	def taxRate
		 Tax.specialRate
	end
end

class Tax
	def self.normalRate
		0.10
	end
	def self.specialRate
		0.00
	end
	def self.importRate
		0.05
	end
end

#class Bill to add and print the Bill
class Bill
	attr_accessor :items

	def initialize
    @items = []    
 	end

	def addItem (item)
		@items.push(item)
	end
	#define a round up tax method based on requirement
	def roundUpTax (tax)
		0.05*(tax/0.05).ceil(0)
	end

	def printBill
		total = 0
		totalTax = 0
		@items.each { 
			|item|
			tax = item.price*(item.taxRate+item.importRate)
			#round up the tax before adding value to the cost
			input_price = item.price + roundUpTax(tax)
			total += input_price * item.quantity
			totalTax += item.quantity * roundUpTax(tax)
			puts "#{item.quantity} #{item.title} #{input_price.round(2)}"
		}		
		puts "Tax: #{totalTax.round(2)}" 
		puts "Total: #{total.round(2)}"
		puts ""
	end
end

bill1 = Bill.new
bill1.addItem(ProductLine.generate("book", "book", 1, 12.49, "no"))
bill1.addItem(ProductLine.generate("others", "music cd", 1, 14.99, "no"))
bill1.addItem(ProductLine.generate("food", "chocolate bar", 1, 0.85, "no"))
bill1.printBill

bill2 = Bill.new
bill2.addItem(ProductLine.generate("food", " imported box of chocolates ", 1, 10.00, "import"))
bill2.addItem(ProductLine.generate("others", "imported bottle of perfume ", 1, 47.50, "import"))
bill2.printBill

bill3 = Bill.new
bill3.addItem(ProductLine.generate("others", "imported bottle of perfume", 1, 27.99, "import"))
bill3.addItem(ProductLine.generate("others", "bottle of perfume", 1, 18.99, "no"))
bill3.addItem(ProductLine.generate("medical", "packet of headache pills ", 1, 9.75, "no"))
bill3.addItem(ProductLine.generate("food", "box of imported chocolates ", 1, 11.25, "import"))
bill3.printBill




	


