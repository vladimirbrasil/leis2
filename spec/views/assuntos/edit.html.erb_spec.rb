require 'spec_helper'

describe "assuntos/edit" do
  before(:each) do
    @assunto = assign(:assunto, stub_model(Assunto,
      :name => "MyString"
    ))
  end

  it "renders the edit assunto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assuntos_path(@assunto), :method => "post" do
      assert_select "input#assunto_name", :name => "assunto[name]"
    end
  end
end
