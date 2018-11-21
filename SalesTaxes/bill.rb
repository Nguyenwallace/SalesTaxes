module App
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
end

