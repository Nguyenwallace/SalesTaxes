
require './productLine'
require './bill'

bill1 = App::Bill.new
bill1.addItem(App::ProductLine.generate("book", "book", 1, 12.49, "no"))
bill1.addItem(App::ProductLine.generate("others", "music cd", 1, 14.99, "no"))
bill1.addItem(App::ProductLine.generate("food", "chocolate bar", 1, 0.85, "no"))
bill1.printBill

bill2 = App::Bill.new
bill2.addItem(App::ProductLine.generate("food", " imported box of chocolates ", 1, 10.00, "import"))
bill2.addItem(App::ProductLine.generate("others", "imported bottle of perfume ", 1, 47.50, "import"))
bill2.printBill

bill3 = App::Bill.new
bill3.addItem(App::ProductLine.generate("others", "imported bottle of perfume", 1, 27.99, "import"))
bill3.addItem(App::ProductLine.generate("others", "bottle of perfume", 1, 18.99, "no"))
bill3.addItem(App::ProductLine.generate("medical", "packet of headache pills ", 1, 9.75, "no"))
bill3.addItem(App::ProductLine.generate("food", "box of imported chocolates ", 1, 11.25, "import"))
bill3.printBill
  
