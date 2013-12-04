require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :laptops_id => 1,
      :users_id => 1,
      :checked_out => false,
      :checked_in => false
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_laptops_id[name=?]", "transaction[laptops_id]"
      assert_select "input#transaction_users_id[name=?]", "transaction[users_id]"
      assert_select "input#transaction_checked_out[name=?]", "transaction[checked_out]"
      assert_select "input#transaction_checked_in[name=?]", "transaction[checked_in]"
    end
  end
end
