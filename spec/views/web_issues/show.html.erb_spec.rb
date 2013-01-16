require 'spec_helper'

describe "web_issues/show" do
  before(:each) do
    @web_issue = assign(:web_issue, stub_model(WebIssue,
      :publication => "Publication",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Publication/)
    rendered.should match(/Name/)
  end
end
