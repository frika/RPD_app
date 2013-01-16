require 'spec_helper'

describe "web_issues/edit" do
  before(:each) do
    @web_issue = assign(:web_issue, stub_model(WebIssue,
      :publication => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit web_issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_issues_path(@web_issue), :method => "post" do
      assert_select "input#web_issue_publication", :name => "web_issue[publication]"
      assert_select "input#web_issue_name", :name => "web_issue[name]"
    end
  end
end
