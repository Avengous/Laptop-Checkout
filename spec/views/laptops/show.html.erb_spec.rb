require 'spec_helper'

describe "laptops/show" do
  before(:each) do
    @laptop = assign(:laptop, stub_model(Laptop,
      :scan_code => "Scan Code",
      :item_name => "Item Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Scan Code/)
    rendered.should match(/Item Name/)
  end
end
