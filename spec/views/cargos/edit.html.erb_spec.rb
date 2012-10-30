require 'spec_helper'

describe "cargos/edit" do
  before(:each) do
    @cargo = assign(:cargo, stub_model(Cargo,
      :name => "MyString"
    ))
  end

  it "renders the edit cargo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cargos_path(@cargo), :method => "post" do
      assert_select "input#cargo_name", :name => "cargo[name]"
    end
  end
end
