#Super class product 
class Product
	attr_accessor :category, :title, :quantity, :price, :imported
	def initialize (category, title, quantity, price, imported)
		@category = category
		@title = title
		@quantity = quantity
		@price = price
		@imported= imported
	end
	def imported
		if (@imported =="imported")
			0.05
		else 
			0.0
		end
	end
	#generate items depends on category (food, medical, book are special, others are normal)
	def self.generate(category, title, quantity, price, imported)
		if (category == "book" || category == "medical" || category == "food")
			 SpecialProduct.new(category, title, quantity, price, imported)
		else 
			 NormalProduct.new(category, title, quantity, price, imported)
		end		
	end
end

#child class inherit Product
class NormalProduct < Product
	def tax
		 0.10
	end
end

#child class inherit Product
class SpecialProduct < Product
	def tax
		 0.00
	end
end

#class Bill to add and print the Bill
class Bill
	attr_accessor :items

	def initialize
    @items = []    
 	end

	def addItem (product)
		@items.push(product)
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
			tax = item.price*(item.tax+item.imported)
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
bill1.addItem(Product.generate("book", "book", 1, 12.49, "no"))
bill1.addItem(Product.generate("others", "music cd", 1, 14.99, "no"))
bill1.addItem(Product.generate("food", "chocolate bar", 1, 0.85, "no"))
bill1.printBill

bill2 = Bill.new
bill2.addItem(Product.generate("food", " imported box of chocolates ", 1, 10.00, "imported"))
bill2.addItem(Product.generate("others", "imported bottle of perfume ", 1, 47.50, "imported"))
bill2.printBill

bill3 = Bill.new
bill3.addItem(Product.generate("others", "imported bottle of perfume", 1, 27.99, "imported"))
bill3.addItem(Product.generate("others", "bottle of perfume", 1, 18.99, "no"))
bill3.addItem(Product.generate("medical", "packet of headache pills ", 1, 9.75, "no"))
bill3.addItem(Product.generate("food", "box of imported chocolates ", 1, 11.25, "imported"))
bill3.printBill




	


