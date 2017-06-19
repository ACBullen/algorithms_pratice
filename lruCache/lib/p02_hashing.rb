class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    arrhash = 0
    each_with_index do |el,idx|
      arrhash += (el.hash + idx.hash).hash
    end
    arrhash
  end
end

class String
  def hash
    strhash = 0
    each_char do |char|
      strhash += (char.ord + self.index(char)).hash
    end
    strhash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashhash = 0
    self.each do |k, v|
      hashhash += k.hash + v.hash
    end
    hashhash
  end
end
