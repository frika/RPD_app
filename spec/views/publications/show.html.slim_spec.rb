require 'spec_helper'

describe "publications/show" do
  before(:each) do
    @publication = assign(:publication, stub_model(Publication,
      :name => "Name",
      :abbreviation => "Abbreviation",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Abbreviation/)
    rendered.should match(/Url/)
  end
end
