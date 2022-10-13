require_relative '../lib/xmas'

describe "get email method" do
  it "should return array" do
    expect(get_end("aspiran")).to eq("mairie-aspiran@wanadoo.fr")
   end


end