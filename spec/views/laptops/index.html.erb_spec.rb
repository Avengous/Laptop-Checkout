require 'spec_helper'

describe "laptops/index" do
  before(:each) do
    assign(:laptops, [
      stub_model(Laptop,
        :scan_code => "Scan Code",
        :item_name => "Item Name"
      ),
      stub_model(Laptop,
        :scan_code => "Scan Code",
        :item_name => "Item Name"
      )
    ])
  end

  it "renders a list of laptops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Scan Code".to_s, :count => 2
    assert_select "tr>td", :text => "Item Name".to_s, :count => 2
  end
end
