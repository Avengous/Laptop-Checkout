require 'spec_helper'

describe "user_histories/edit" do
  before(:each) do
    @user_history = assign(:user_history, stub_model(UserHistory,
      :user_id => 1,
      :transaction_id => 1
    ))
  end

  it "renders the edit user_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_history_path(@user_history), "post" do
      assert_select "input#user_history_user_id[name=?]", "user_history[user_id]"
      assert_select "input#user_history_transaction_id[name=?]", "user_history[transaction_id]"
    end
  end
end
