require 'spec_helper'

describe "laptops/new" do
  before(:each) do
    assign(:laptop, stub_model(Laptop,
      :scan_code => "MyString",
      :item_name => "MyString"
    ).as_new_record)
  end

  it "renders new laptop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", laptops_path, "post" do
      assert_select "input#laptop_scan_code[name=?]", "laptop[scan_code]"
      assert_select "input#laptop_item_name[name=?]", "laptop[item_name]"
    end
  end
end
