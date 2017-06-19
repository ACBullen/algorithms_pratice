require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  singletons = HashMap.new
  odd = string.length.odd?

  string.each_char do |char|
    if singletons.include?(char)
      singletons.delete(char)
    else
      singletons[char] = 1
    end
  end

  odd ? singletons.count == 1 : singletons.count == 0
end
