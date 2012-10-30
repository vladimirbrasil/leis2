require 'spec_helper'

describe "classes/new" do
  before(:each) do
    assign(:classe, stub_model(Classe,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new classe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classes_path, :method => "post" do
      assert_select "input#classe_name", :name => "classe[name]"
    end
  end
end
