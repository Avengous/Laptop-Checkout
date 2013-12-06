require 'spec_helper'

describe "laptop_histories/new" do
  before(:each) do
    assign(:laptop_history, stub_model(LaptopHistory,
      :laptop_id => 1,
      :transaction_id => 1
    ).as_new_record)
  end

  it "renders new laptop_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", laptop_histories_path, "post" do
      assert_select "input#laptop_history_laptop_id[name=?]", "laptop_history[laptop_id]"
      assert_select "input#laptop_history_transaction_id[name=?]", "laptop_history[transaction_id]"
    end
  end
end
