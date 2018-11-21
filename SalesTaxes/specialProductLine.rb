module App
  #child class inherit ProductLine
  class SpecialProductLine < ProductLine
  	def taxRate
  	 App::Tax::SpecialRate
  	end
  end
end