
def string_reverse_inplace(str)
	for i in (0..(str.length/2))
		# temp = str[i]
		# str[i] = str[-i-1]
		# str[-i-1] = temp

		str[i], str[-i-1] = str[-i-1], str[i]
	end

	puts str
end

string_reverse_inplace("hello")
string_reverse_inplace("it's hot in here")
string_reverse_inplace("taco")
string_reverse_inplace("this is a pretty long sentence that just seems to drag on and on")