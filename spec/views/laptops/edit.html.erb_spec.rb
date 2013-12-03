require 'spec_helper'

describe "laptops/edit" do
  before(:each) do
    @laptop = assign(:laptop, stub_model(Laptop,
      :scan_code => "MyString",
      :item_name => "MyString"
    ))
  end

  it "renders the edit laptop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", laptop_path(@laptop), "post" do
      assert_select "input#laptop_scan_code[name=?]", "laptop[scan_code]"
      assert_select "input#laptop_item_name[name=?]", "laptop[item_name]"
    end
  end
end
