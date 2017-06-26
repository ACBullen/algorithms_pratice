# an animal shelter, which holds only dogs and cats, operates on a strictly "FIFO"
# basis. People must adopt either the "oldest" (based on arrival time) or they
# can select whether they would prefer a dog or a cat and get the oldest of that
# animal species.

class AnimalShelterList
  def initialize
    @head = AnimalNode.new
    @tail = AnimalNode.new
    @tail.last = @head
    @head.last = @tail
  end

  def enqueue(species)
    animal = AnimalNode.new(species)
    former_last = @tail.last
    animal.last = former_last
    animal.next = @tail
    @tail.last = animal
    former_last.next = animal
    animal.val
  end

  def dequeue_any
    adoptee = @head.next
    @head.next = adoptee.next
    adoptee.next.last = @head
    adoptee.next = nil
    adoptee.last = nil

    adoptee.val
  end

  def dequeue_cat
    cur_animal = @head.next
    until cur_animal.nil? || cur_animal.val == "cat"
      cur_animal = cur_animal.next
    end

    prev_animal = cur_animal.last
    next_animal = cur_animal.next

    next_animal.last = prev_animal
    prev_animal.next = next_animal

    cur_animal.next = nil
    cur_animal.last = nil

    cur_animal.val
  end

  def dequeue_dog
    cur_animal = @head.next
    until cur_animal.nil? || cur_animal.val == "dog"
      cur_animal = cur_animal.next
    end

    prev_animal = cur_animal.last
    next_animal = cur_animal.next

    next_animal.last = prev_animal
    prev_animal.next = next_animal

    cur_animal.next = nil
    cur_animal.last = nil

    cur_animal.val
  end
end

class AnimalNode
  def initialize(species = nil)
    @val = species
    @next = nil
    @last = nil
  end
end
