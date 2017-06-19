# A string with the characters [,], {,},(,) is said to be well formed if the different types of brackets
# match in the correct order.
# for example, ([]){()} is well formed, but [(]{)} is not
def well_formed?(str)
  return false if str.length % 2 != 0
  left_char = []
  lookup ={ '('=> ')', '['=>']', '{' => '}' }
  str.each_char do |char|
    if lookup.keys.include?(char)
      left_char.push(char)
    else
      return false
    end
  end

  true
end
