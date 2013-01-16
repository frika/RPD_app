require 'spec_helper'

describe "web_issues/index" do
  before(:each) do
    assign(:web_issues, [
      stub_model(WebIssue,
        :publication => "Publication",
        :name => "Name"
      ),
      stub_model(WebIssue,
        :publication => "Publication",
        :name => "Name"
      )
    ])
  end

  it "renders a list of web_issues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Publication".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
