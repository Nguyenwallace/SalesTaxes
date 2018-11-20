#child class inherit ProductLine

class SpecialProductLine < ProductLine
	def taxRate
		Tax::SpecialRate
	end
end