require 'spec_helper'

describe "classes/edit" do
  before(:each) do
    @classe = assign(:classe, stub_model(Classe,
      :name => "MyString"
    ))
  end

  it "renders the edit classe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classes_path(@classe), :method => "post" do
      assert_select "input#classe_name", :name => "classe[name]"
    end
  end
end
