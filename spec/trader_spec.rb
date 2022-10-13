require_relative '../lib/trader'

describe "test the realisation of the array" do
    it "should return array" do
        expect(trader()).is_a? Array
    end
end