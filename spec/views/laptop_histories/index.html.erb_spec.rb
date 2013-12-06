require 'spec_helper'

describe "laptop_histories/index" do
  before(:each) do
    assign(:laptop_histories, [
      stub_model(LaptopHistory,
        :laptop_id => 1,
        :transaction_id => 2
      ),
      stub_model(LaptopHistory,
        :laptop_id => 1,
        :transaction_id => 2
      )
    ])
  end

  it "renders a list of laptop_histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
