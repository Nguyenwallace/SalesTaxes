module App
  #child class inherit ProductLine
  class NormalProductLine < ProductLine
  	def taxRate
  	 App::Tax::NormalRate
  	end
  end
end

