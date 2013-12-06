require 'spec_helper'

describe "laptop_histories/edit" do
  before(:each) do
    @laptop_history = assign(:laptop_history, stub_model(LaptopHistory,
      :laptop_id => 1,
      :transaction_id => 1
    ))
  end

  it "renders the edit laptop_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", laptop_history_path(@laptop_history), "post" do
      assert_select "input#laptop_history_laptop_id[name=?]", "laptop_history[laptop_id]"
      assert_select "input#laptop_history_transaction_id[name=?]", "laptop_history[transaction_id]"
    end
  end
end
