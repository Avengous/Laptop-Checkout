require 'spec_helper'

describe "LaptopHistories" do
  describe "GET /laptop_histories" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get laptop_histories_path
      response.status.should be(200)
    end
  end
end
