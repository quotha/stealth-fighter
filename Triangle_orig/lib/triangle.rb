class Triangle
  
  attr_accessor :name, :data
  
  
  def initialize file
    @name = file
    @data = {}
    f = File.new(file)
    f.each {|line|
      #puts line
      #puts "..........."
      @data["#{f.lineno}"] = line.split(" ")
    }    
  end
  
  def total_lines
    data.size
  end
  
  def get_line number
    data["#{number}"]
  end
  
  def value_at_position line, position
    get_line(line)[position-1].to_i
  end
  
  def get_children line, position
    child_line = get_line line+1
    children = child_line.drop(position-1).take(2)    
  end
  
  def get_parent_value line, position
    if line == 1 
      0
    elsif line == 2
      value_at_position 1, 1
    elsif position == 1
      value_at_position(line-1, 1)
    else
      parent_line = get_line line-1
      parents = parent_line.drop(position-2).take(2)
      parents.max.to_i
    end
  end
  
  def parent_position line, position
    if line == 1 
      nil
    elsif line == 2
      [1, 1]
    elsif position == 1
      [line-1, 1]
    else
      if value_at_position(line-1, position-1) > value_at_position(line-1, position)
        [line-1, position-1]
      else
        [line-1, position]
      end
      #parent_line = get_line line-1
      #parents = parent_line.drop(position-2).take(2)
      #parents.max.to_i
    end
  end
  
  def total_left line, position
    value_at_position(line,position)+get_children(line,position).first.to_i
  end
  
  def total_right line, position
    value_at_position(line,position)+get_children(line,position).last.to_i
  end
  
  def value_of_first_child line, position
    get_children(line,position).first.to_i
  end
  
  def value_of_last_child line, position
    get_children(line,position).last.to_i
  end
  
  def total_from_position line, position
    if line == total_lines
      total = value_at_position(line, position)
    else
      if value_of_first_child(line, position) > value_of_last_child(line, position)
        total_from_position(line+1, position) + value_at_position(line, position)
      else
        total_from_position(line+1, position+1) + value_at_position(line, position)
      end
    end
  end
  
  def totals_from_position line, position, totals=[]
    
    if line == total_lines
      totals << value_at_position(line, position)
    else
      
      get_total_from(line, position)
      
    end
    
    
  end
  
  def get_total_from line, position
    id = "#{line}#{position}".to_i
    #puts id
    @total ||= []
    @total[id] ||= begin
      #puts id
      value = value_at_position(line, position)
      x = [totals_from_position(line+1,position).max] + [totals_from_position(line+1,position+1).max]
      x.map {|a| a+value}
      #puts x
    end
    
  end
  
  
end






puts "analysing triangle"

my_triangle = Triangle.new "test_triangle.txt"
#puts my_triangle.inspect
puts "totals:"
puts my_triangle.totals_from_position(1,1).max