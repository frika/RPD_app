require 'spec_helper'

describe "publications/index" do
  before(:each) do
    assign(:publications, [
      stub_model(Publication,
        :name => "Name",
        :abbreviation => "Abbreviation",
        :url => "Url"
      ),
      stub_model(Publication,
        :name => "Name",
        :abbreviation => "Abbreviation",
        :url => "Url"
      )
    ])
  end

  it "renders a list of publications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Abbreviation".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
