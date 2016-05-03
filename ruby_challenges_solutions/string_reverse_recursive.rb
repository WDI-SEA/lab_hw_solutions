# Write a method to `reverse` a word in-place, do not use iterators,
# use only a while loop and indices.

# def reverse(str)
# 	reversed_str = ''
# 	index = str.length - 1
# 	until index <= -1
# 		reversed_str << str[index]
# 		index -= 1
# 	end

# 	return reversed_str
# end

def reverse_r(str)
	if str.length > 1
		str[str.length - 1] + reverse_r(str[0, str.length - 1])
	else
		str
	end
end

# puts reverse("hello")

puts reverse_r("woahhhhhhh")



