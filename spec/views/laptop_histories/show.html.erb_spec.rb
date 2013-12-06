require 'spec_helper'

describe "laptop_histories/show" do
  before(:each) do
    @laptop_history = assign(:laptop_history, stub_model(LaptopHistory,
      :laptop_id => 1,
      :transaction_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
