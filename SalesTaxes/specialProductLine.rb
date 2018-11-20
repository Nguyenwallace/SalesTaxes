#child class inherit ProductLine

class SpecialProductLine < ProductLine
	def taxRate
		Tax.specialRate
	end
end