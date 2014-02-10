require 'triangle'

describe Triangle do
  
  let(:my_triangle){Triangle.new "small_triangle.txt"}
  
  describe "#line" do
    context "when given a triangle" do
      it "should return the line requested" do
        expect(my_triangle.line(2)).to eq(["2", "3"])
      end
    end
  end

  describe "#position" do
    context "when given a triangle" do
      it "should return the value at that position" do
        expect(my_triangle.position([2,1])).to eq(2)
      end
    end
  end
  
  describe "#children" do
    context "when given a triangle" do
      it "should return the chilren of the given position" do
        expect(my_triangle.children([2,1])).to eq(["4", "5"])
      end
      it "should return the chilren of the given position" do
        expect(my_triangle.children([3,2])).to eq(["8", "9"])
      end
    end
  end
  
  describe "#first_child" do
    context "when given a triangle" do
      it "should return the value of the 1st child" do
        expect(my_triangle.first_child([2,1])).to eq(4)
      end
      it "should return the value of the 1st child" do
        expect(my_triangle.first_child([3,2])).to eq(8)
      end
    end
  end
  
  describe "#second_child" do
    context "when given a triangle" do
      it "should return the value of the 2nd child" do
        expect(my_triangle.second_child([2,1])).to eq(5)
      end
      it "should return the value of the 2nd child" do
        expect(my_triangle.second_child([3,2])).to eq(9)
      end
    end
  end

  describe "#maximum_total" do
    context "when given a position on the last line triangle" do
      it "should return the total values" do
        expect(my_triangle.maximum_total).to eq(20)
      end
    end
    
  end
  
end