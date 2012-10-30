require 'spec_helper'

describe "classes/index" do
  before(:each) do
    assign(:classes, [
      stub_model(Classe,
        :name => "Name"
      ),
      stub_model(Classe,
        :name => "Name"
      )
    ])
  end

  it "renders a list of classes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
