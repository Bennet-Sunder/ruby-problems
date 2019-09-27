require "set"
Point = Struct.new(:x, :y)

class Maze
  CurrentPosition = Struct.new(:pos, :steps)

  def initialize(maze, rows = 13, cols = 38)
    @maze = maze
    @rows = 13
    @cols = 38
  end

  def bfs(source, target)
    start_pos = @maze.index(source)
    start_x = start_pos / @cols
    start_y = start_pos % @cols - 1
    if start_y < 0
      start_y = @cols - 1
    end
    start_point = Point.new(start_x, start_y)
    visited = [start_point].to_set
    next_queue = [CurrentPosition.new(start_point, 0)]
    while !next_queue.empty?
      temp = next_queue.pop

      if get_maze_position(temp.pos) == target
        return true, temp.steps
      end
      #check if can move right
      new_pos = Point.new(temp.pos.x + 1, temp.pos.y)
      if is_valid_position(new_pos) && !visited.include?(new_pos)
        visited.add(new_pos)
        next_queue.push(CurrentPosition.new(new_pos, temp.steps + 1))
      end
      #check if can move left
      new_pos = Point.new(temp.pos.x - 1, temp.pos.y)
      if is_valid_position(new_pos) && !visited.include?(new_pos)
        visited.add(new_pos)
        next_queue.push(CurrentPosition.new(new_pos, temp.steps + 1))
      end
      #check if can move up
      new_pos = Point.new(temp.pos.x, temp.pos.y + 1)
      if is_valid_position(new_pos) && !visited.include?(new_pos)
        visited.add(new_pos)
        next_queue.push(CurrentPosition.new(new_pos, temp.steps + 1))
      end
      #check if can move down
      new_pos = Point.new(temp.pos.x, temp.pos.y - 1)
      if is_valid_position(new_pos) && !visited.include?(new_pos)
        visited.add(new_pos)
        next_queue.push(CurrentPosition.new(new_pos, temp.steps + 1))
      end
    end

    return false, 0
  end

  def is_valid_position(point)
    (point.x >= 0 && point.x < @rows) && (point.y >= 0 && point.y < @cols) && get_maze_position(point) != "#"
  end

  def get_maze_position(point)
    index = (point.x * @cols) + point.y + 1
    if index >= @maze.length
      return "-1"
    end
    return @maze[index]
  end

  def solvable?
    result, steps = bfs("A", "B")
    return result
  end

  def steps
    result, steps = bfs("A", "B")
    return steps
  end
end
