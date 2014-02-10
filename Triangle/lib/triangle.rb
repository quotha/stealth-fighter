class Triangle
  
  attr_accessor :name, :data
  
  def initialize file
    @name = file
    @data = {}
    f = File.new(file)
    f.each {|line|
      @data["#{f.lineno}"] = line.split(" ")
    }    
  end
  
  def total_lines
    data.size
  end
  
  def line number
    data["#{number}"]
  end
  
  def position position
    line(position[0])[position[1]-1].to_i
  end
  
  def children position
    line(position[0]+1).drop(position[1]-1).take(2)
  end

  def first_child position
    children(position).first.to_i
  end
  
  def second_child position
    children(position).last.to_i
  end
  
  def maximum_total
    total_from_position [1, 1]
  end
  
  private
  
  def total_from_position position
    if position[0] == total_lines
      position position
    else
      if first_child(position) > second_child(position)
        total_from_position([position[0]+1, position[1]]) + position(position)
      else
        total_from_position([position[0]+1, position[1]+1]) + position(position)
      end
    end
  end
  
end

puts "analysing triangle"
my_triangle = Triangle.new "test_triangle.txt"
puts "maximum total is #{my_triangle.maximum_total}"