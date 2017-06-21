class DynamicProgramming
  def initialize
    @blair_cache = { 1=> 1, 2=> 2 }
    @frog_cache = { 0 => [[]], 1 => [[1]], 2 => [[1,1], [2]],  3=> [[1,1,1], [2,1], [1,2], [3]] }
    @super_frog_cache = { 0 => [[]], 1 => [[1]]}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + (2 * n - 1)
  end

  def frog_hops(n)
    return @frog_cache[n] if @frog_cache[n]
    @frog_cache[n] = []
    hops = [1,2,3]
    hops.each do |hop|
      if n - hop >= 0
        frog_hops(n - hop).each do |arr|
          @frog_cache[n].push((arr.dup << hop))
        end
      end
    end

    return @frog_cache[n]
  end

  def frog_cache_builder(n)
    frog_cache = {}
    frog_cache[0] = [[]]
    frog_cache[1] = [[1]]
    frog_cache[2] = [[2], [1,1]]
    frog_cache[3] = [[3], [2, 1], [1,1,1], [1,2]]

    return frog_cache[n] if frog_cache[n]

    (4..n).each do |i|
      frog_cache[i] = []
      hops = [1,2,3]
      hops.each do |hop|
        frog_cache[i - hop].each do |arr|
          arr.dup << hop
          frog_cache[i] << arr
        end
      end
    end
    frog_cache
  end

  # def frog_hops_top_down(n)
  #
  # end

  def super_frog_hops(n, k)
    return @frog_cache[n] if 
    hops = (1..k).to_a


  end

  def make_change(amt, coins)

  end

  def maze_solver(maze, start_pos, end_pos)
  end

end
