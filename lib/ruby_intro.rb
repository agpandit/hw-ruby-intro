# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  
# This method basically returns sum of all elements in an array
  arr.inject(0, :+)
end

def max_2_sum arr
  
# This methods finds the sum of the two largest element in the given array arr

# Special handling for empty array or length 1 , in case of length 1 we return the first element itself
  if arr.empty? 
      return 0
  elsif arr.length == 1
      return arr[0]
  end
  
# We calculate the largest and second largest element among first two array numbers two initialize the corresponding variables
  firstLargest = [arr[0],arr[1]].max
  secondLargest = [arr[0],arr[1]].min
  
  for index in (2..arr.length-1) do
      if arr[index].to_i > firstLargest
          secondLargest = firstLargest
          firstLargest = arr[index]
      elsif arr[index].to_i > secondLargest
          secondLargest = arr[index]
      end
  end
  
  return (firstLargest + secondLargest)
end

def sum_to_n? arr, n
  
  # Return for edge case when array is passed as [] or if it has a single element
  if arr.length.to_i <= 1
      return false
  end
  
  # Create an empty hash to store each array number as keys with their complements
  # Complement of each element is nothing but n (the sum) - each number in array
  arrayHash = Hash.new()
  
  for number in arr
      complement = n-number
      if arrayHash[complement]
          return true
      end
      arrayHash[number] = complement
  end

  # if the control reaches here then the array has already been scanned and no complement exists
  return false
end

# Part 2

def hello(name)
  
 fixedString = "Hello, "
 return fixedString.concat(name)

end

def starts_with_consonant? s

# regex with a lookahead since it has to work with letters also

  if /\A(?=[^aeiou])(?=[a-z])/i.match(s) == nil
    return false
  else
    return true
  end
  
end

def binary_multiple_of_4? s

  if s.empty?
      return false
  end
  
  if s.length == 1
      if s[0] == '0'
          return true
      else
          return false
      end
  end
  
# Validating input as it should be binary only
  if !(s !~ /[^01]/)
      return false
  end
  
# checking if last two elements of the binary input is '00'
  if s[s.length-1] == '0'
      if s[s.length-2] == '0'
          return true
      else
          return false
      end
  else
      return false
  end
  
end

# Part 3

class BookInStock

# Meta-Programming to generate the getters and setters for these attributes
    attr_accessor :isbn , :price
    
    def initialize (isbn,price)
        raise ArgumentError,'isbn is not present'  if isbn.empty?
        raise ArgumentError,'price is less than 0'  unless price > 0
        @isbn=isbn 
        @price=price
    end
    
    def price_as_string

# We just concatenate dollar and the convert the representation to float
        return "$" << '%.2f' % price.to_s 
    end
end
