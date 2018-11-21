module App
  #child class inherit ProductLine
  class NormalProductLine < ProductLine
  	def taxRate
  	 Tax::NormalRate
  	end
  end
end

