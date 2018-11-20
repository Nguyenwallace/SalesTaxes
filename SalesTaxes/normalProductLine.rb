#child class inherit ProductLine

class NormalProductLine < ProductLine
	def taxRate
		Tax.normalRate
	end
end

