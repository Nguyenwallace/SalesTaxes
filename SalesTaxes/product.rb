module App
  #Super class ProductLine 
  class Product
    attr_accessor :category, :title, :price, :import
    def initialize (category, title, price, import)
      @category = category
      @title = title   
      @price = price
      @import= import    
    end    
  end
end 