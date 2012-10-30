require 'spec_helper'

describe "cargos/index" do
  before(:each) do
    assign(:cargos, [
      stub_model(Cargo,
        :name => "Name"
      ),
      stub_model(Cargo,
        :name => "Name"
      )
    ])
  end

  it "renders a list of cargos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
