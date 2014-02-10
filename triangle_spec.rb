require 'triangle'

describe "#value_at_position" do
  context "when given a triangle" do
    it "should return the value at that position" do
      expect(value_at_position(2,1)).to eq(1)
    end
  end
end