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

describe ClassesController do

  # This should return the minimal set of attributes required to create a valid
  # Classe. As you add validations to Classe, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClassesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all classes as @classes" do
      classe = Classe.create! valid_attributes
      get :index, {}, valid_session
      assigns(:classes).should eq([classe])
    end
  end

  describe "GET show" do
    it "assigns the requested classe as @classe" do
      classe = Classe.create! valid_attributes
      get :show, {:id => classe.to_param}, valid_session
      assigns(:classe).should eq(classe)
    end
  end

  describe "GET new" do
    it "assigns a new classe as @classe" do
      get :new, {}, valid_session
      assigns(:classe).should be_a_new(Classe)
    end
  end

  describe "GET edit" do
    it "assigns the requested classe as @classe" do
      classe = Classe.create! valid_attributes
      get :edit, {:id => classe.to_param}, valid_session
      assigns(:classe).should eq(classe)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Classe" do
        expect {
          post :create, {:classe => valid_attributes}, valid_session
        }.to change(Classe, :count).by(1)
      end

      it "assigns a newly created classe as @classe" do
        post :create, {:classe => valid_attributes}, valid_session
        assigns(:classe).should be_a(Classe)
        assigns(:classe).should be_persisted
      end

      it "redirects to the created classe" do
        post :create, {:classe => valid_attributes}, valid_session
        response.should redirect_to(Classe.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved classe as @classe" do
        # Trigger the behavior that occurs when invalid params are submitted
        Classe.any_instance.stub(:save).and_return(false)
        post :create, {:classe => {}}, valid_session
        assigns(:classe).should be_a_new(Classe)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Classe.any_instance.stub(:save).and_return(false)
        post :create, {:classe => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested classe" do
        classe = Classe.create! valid_attributes
        # Assuming there are no other classes in the database, this
        # specifies that the Classe created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Classe.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => classe.to_param, :classe => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested classe as @classe" do
        classe = Classe.create! valid_attributes
        put :update, {:id => classe.to_param, :classe => valid_attributes}, valid_session
        assigns(:classe).should eq(classe)
      end

      it "redirects to the classe" do
        classe = Classe.create! valid_attributes
        put :update, {:id => classe.to_param, :classe => valid_attributes}, valid_session
        response.should redirect_to(classe)
      end
    end

    describe "with invalid params" do
      it "assigns the classe as @classe" do
        classe = Classe.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Classe.any_instance.stub(:save).and_return(false)
        put :update, {:id => classe.to_param, :classe => {}}, valid_session
        assigns(:classe).should eq(classe)
      end

      it "re-renders the 'edit' template" do
        classe = Classe.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Classe.any_instance.stub(:save).and_return(false)
        put :update, {:id => classe.to_param, :classe => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested classe" do
      classe = Classe.create! valid_attributes
      expect {
        delete :destroy, {:id => classe.to_param}, valid_session
      }.to change(Classe, :count).by(-1)
    end

    it "redirects to the classes list" do
      classe = Classe.create! valid_attributes
      delete :destroy, {:id => classe.to_param}, valid_session
      response.should redirect_to(classes_url)
    end
  end

end
