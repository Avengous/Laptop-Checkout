require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LaptopHistoriesController do

  # This should return the minimal set of attributes required to create a valid
  # LaptopHistory. As you add validations to LaptopHistory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "laptop_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LaptopHistoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all laptop_histories as @laptop_histories" do
      laptop_history = LaptopHistory.create! valid_attributes
      get :index, {}, valid_session
      assigns(:laptop_histories).should eq([laptop_history])
    end
  end

  describe "GET show" do
    it "assigns the requested laptop_history as @laptop_history" do
      laptop_history = LaptopHistory.create! valid_attributes
      get :show, {:id => laptop_history.to_param}, valid_session
      assigns(:laptop_history).should eq(laptop_history)
    end
  end

  describe "GET new" do
    it "assigns a new laptop_history as @laptop_history" do
      get :new, {}, valid_session
      assigns(:laptop_history).should be_a_new(LaptopHistory)
    end
  end

  describe "GET edit" do
    it "assigns the requested laptop_history as @laptop_history" do
      laptop_history = LaptopHistory.create! valid_attributes
      get :edit, {:id => laptop_history.to_param}, valid_session
      assigns(:laptop_history).should eq(laptop_history)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LaptopHistory" do
        expect {
          post :create, {:laptop_history => valid_attributes}, valid_session
        }.to change(LaptopHistory, :count).by(1)
      end

      it "assigns a newly created laptop_history as @laptop_history" do
        post :create, {:laptop_history => valid_attributes}, valid_session
        assigns(:laptop_history).should be_a(LaptopHistory)
        assigns(:laptop_history).should be_persisted
      end

      it "redirects to the created laptop_history" do
        post :create, {:laptop_history => valid_attributes}, valid_session
        response.should redirect_to(LaptopHistory.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved laptop_history as @laptop_history" do
        # Trigger the behavior that occurs when invalid params are submitted
        LaptopHistory.any_instance.stub(:save).and_return(false)
        post :create, {:laptop_history => { "laptop_id" => "invalid value" }}, valid_session
        assigns(:laptop_history).should be_a_new(LaptopHistory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LaptopHistory.any_instance.stub(:save).and_return(false)
        post :create, {:laptop_history => { "laptop_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested laptop_history" do
        laptop_history = LaptopHistory.create! valid_attributes
        # Assuming there are no other laptop_histories in the database, this
        # specifies that the LaptopHistory created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LaptopHistory.any_instance.should_receive(:update).with({ "laptop_id" => "1" })
        put :update, {:id => laptop_history.to_param, :laptop_history => { "laptop_id" => "1" }}, valid_session
      end

      it "assigns the requested laptop_history as @laptop_history" do
        laptop_history = LaptopHistory.create! valid_attributes
        put :update, {:id => laptop_history.to_param, :laptop_history => valid_attributes}, valid_session
        assigns(:laptop_history).should eq(laptop_history)
      end

      it "redirects to the laptop_history" do
        laptop_history = LaptopHistory.create! valid_attributes
        put :update, {:id => laptop_history.to_param, :laptop_history => valid_attributes}, valid_session
        response.should redirect_to(laptop_history)
      end
    end

    describe "with invalid params" do
      it "assigns the laptop_history as @laptop_history" do
        laptop_history = LaptopHistory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LaptopHistory.any_instance.stub(:save).and_return(false)
        put :update, {:id => laptop_history.to_param, :laptop_history => { "laptop_id" => "invalid value" }}, valid_session
        assigns(:laptop_history).should eq(laptop_history)
      end

      it "re-renders the 'edit' template" do
        laptop_history = LaptopHistory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LaptopHistory.any_instance.stub(:save).and_return(false)
        put :update, {:id => laptop_history.to_param, :laptop_history => { "laptop_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested laptop_history" do
      laptop_history = LaptopHistory.create! valid_attributes
      expect {
        delete :destroy, {:id => laptop_history.to_param}, valid_session
      }.to change(LaptopHistory, :count).by(-1)
    end

    it "redirects to the laptop_histories list" do
      laptop_history = LaptopHistory.create! valid_attributes
      delete :destroy, {:id => laptop_history.to_param}, valid_session
      response.should redirect_to(laptop_histories_url)
    end
  end

end
