require 'spec_helper'

describe "cargos/new" do
  before(:each) do
    assign(:cargo, stub_model(Cargo,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new cargo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cargos_path, :method => "post" do
      assert_select "input#cargo_name", :name => "cargo[name]"
    end
  end
end
