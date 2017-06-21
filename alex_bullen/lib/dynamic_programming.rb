class DynamicProgramming
  def initialize
    @blair_cache = { 1=> 1, 2=> 2 }
    @frog_cache = { 0 => [[]], 1 => [[1]], 2 => [[1,1], [2]],  3=> [[1,1,1], [2,1], [1,2], [3]] }
    @super_frog_cache = { 0 => [[]]}
    @maze_cache = []
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
    return @super_frog_cache[n] if @super_frog_cache[n]
    @super_frog_cache[n] = []
    k > n ? k = n  : k = k
    hops = (1..k).to_a
    hops.each do |hop|
      if hop == n
        @super_frog_cache[n] << [hop]
      else
        super_frog_hops(n - hop, k).each do |arr|
          @super_frog_cache[n].push(arr.dup.push(hop))
        end
      end
    end

    @super_frog_cache[n]
  end



  def make_change(amt, coins)
    return [] if amt == 0

  end

  def maze_solver(maze, start_pos, end_pos)
    populate_maze_cache(maze)
    solve_maze(maze, start_pos, end_pos)
  end

  private

  def populate_maze_cache(maze)
    @maze_cache = maze
  end
  def solve_maze(maze, start_pos, end_pos)
    # p start_pos
    return [start_pos] if start_pos == end_pos
    moves = [[1,0],[-1,0],[0,1],[0, -1]]
    valid_moves = false
    moves.each do |dir|
      new_pos = [start_pos[0] + dir[0], start_pos[1] + dir[1]]
      p @maze_cache[new_pos[0]]
      if @maze_cache[new_pos[0]][new_pos[1]] && @maze_cache[new_pos[0]][new_pos[1]] != "X" && @maze_cache[new_pos[0]][new_pos[1]] != "V"
        @maze_cache[start_pos[0]][start_pos[1]] = "V"
        future_steps = solve_maze(maze, new_pos, end_pos)
        if future_steps
          return [[start_pos]].concat(future_steps)
          valid_moves = true
        end
      end
    end

    return nil unless valid_moves
  end

end
