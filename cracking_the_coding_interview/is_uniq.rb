#Given a string, determine if it has all unqique characters.
#what do you do if you can't use other data structures?

#using additional data structure, n space
def is_unique? string
  alph_hash = {}
  string.each_char do |char|
    return false if alph_hash[char]
    alph_hash[char] = true
  end

  true
end

#without additional data structures, O(1) space, n^2 time comp

def is_unique_O1? string
  i = 0
  while i < string.length
    return false if string.index(string[i]) != i
    i += 1
  end
  true
end
