require 'spec_helper'

describe "cargos/show" do
  before(:each) do
    @cargo = assign(:cargo, stub_model(Cargo,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
