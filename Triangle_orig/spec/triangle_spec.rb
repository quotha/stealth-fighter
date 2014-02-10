require 'triangle'

describe Triangle do
  
  let(:my_triangle){Triangle.new "small_triangle.txt"}

  describe "#value_at_position" do
    context "when given a triangle" do
      it "should return the value at that position" do
        expect(my_triangle.value_at_position(2,1)).to eq(2)
      end
    end
  end
  
  describe "#value_of_first_child" do
    context "when given a triangle" do
      it "should return the value of the 1st child" do
        expect(my_triangle.value_of_first_child(2,1)).to eq(4)
      end
    end
  end
  
  describe "#value_of_last_child" do
    context "when given a triangle" do
      it "should return the value of the last child" do
        expect(my_triangle.value_of_last_child(2,1)).to eq(5)
      end
    end
  end
  
  describe "#parent_position" do
    context "when given a position on the last line triangle" do
      it "should return the larger parent position" do
        expect(my_triangle.parent_position(4,2)).to eq([3, 2])
      end
      it "should return the larger parent position" do
        expect(my_triangle.parent_position(4,1)).to eq([3, 1])
      end
      it "should return the larger parent position" do
        expect(my_triangle.parent_position(4,4)).to eq([3, 3])
      end
    end
  end
  
  describe "#get_parent_value" do
    context "when given a position on the last line triangle" do
      it "should return the larger parent" do
        expect(my_triangle.get_parent_value(4,2)).to eq(5)
      end
      it "should return the larger parent" do
        expect(my_triangle.get_parent_value(4,1)).to eq(4)
      end
      it "should return the larger parent" do
        expect(my_triangle.get_parent_value(4,4)).to eq(6)
      end
    end
  end
  

  describe "#total_from_position" do
    context "when given a position on the last line triangle" do
      it "should return the total values" do
        expect(my_triangle.total_from_position(4,1)).to eq(7)
      end
    end
    context "when given a position 2nd to last triangle" do
      it "should return the total values" do
        expect(my_triangle.total_from_position(3,1)).to eq(12)
      end
    end
    context "when given a position 3rd to last triangle" do
      it "should return the total values" do
        expect(my_triangle.total_from_position(2,1)).to eq(16)
      end
    end

    
  end  
  
  
  describe "#totals_from_position" do
    context "when given a position on the last line triangle" do
      it "should return the total values" do
        expect(my_triangle.totals_from_position(4,1)).to eq([7])
      end
    end
    context "when given a position 2nd to last triangle" do
      it "should return the total values" do
        expect(my_triangle.totals_from_position(3,1)).to eq([11, 12])
      end
    end
    context "when given a position 3rd to last triangle" do
      it "should return the total values" do
        expect(my_triangle.totals_from_position(2,1)).to eq([13, 14, 15, 16])
      end
    end

    
  end
  
end