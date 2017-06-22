#Write methods to implement the multipluy, subrtract and divide operations for integers.
#The results of all of these will be integers. Use only the add operator

def multiply num1, num2
  product = 0

  num1.times do
    product += num2
  end

  product
end

# p multiply 4, 5
# p multiply 0, 3
# p multiply 123, 55

def divide numerator, denominator
  step = denominator
  return 1 if numerator == denominator
  result = 0

  until step >= numerator
    step += denominator
    result += 1
  end

  result
end

# p divide 10, 1
# p divide 1, 10
# p divide 2, 2

def subtract num1, num2
  result = 0
  if num1 >= num2
    until result + num2 == num1
      result += 1
    end
    result
  else
    until result + num1 == num2
      result += 1
    end
    return -result
  end

end

# p subtract 1,1
# p subtract 10, 5
# p subtract 2, 20
