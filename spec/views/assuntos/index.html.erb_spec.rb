require 'spec_helper'

describe "assuntos/index" do
  before(:each) do
    assign(:assuntos, [
      stub_model(Assunto,
        :name => "Name"
      ),
      stub_model(Assunto,
        :name => "Name"
      )
    ])
  end

  it "renders a list of assuntos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
