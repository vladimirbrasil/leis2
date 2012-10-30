require 'spec_helper'

describe "assuntos/new" do
  before(:each) do
    assign(:assunto, stub_model(Assunto,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new assunto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assuntos_path, :method => "post" do
      assert_select "input#assunto_name", :name => "assunto[name]"
    end
  end
end
