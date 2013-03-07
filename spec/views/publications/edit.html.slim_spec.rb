require 'spec_helper'

describe "publications/edit" do
  before(:each) do
    @publication = assign(:publication, stub_model(Publication,
      :name => "MyString",
      :abbreviation => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit publication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publications_path(@publication), :method => "post" do
      assert_select "input#publication_name", :name => "publication[name]"
      assert_select "input#publication_abbreviation", :name => "publication[abbreviation]"
      assert_select "input#publication_url", :name => "publication[url]"
    end
  end
end
