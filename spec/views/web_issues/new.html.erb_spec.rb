require 'spec_helper'

describe "web_issues/new" do
  before(:each) do
    assign(:web_issue, stub_model(WebIssue,
      :publication => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new web_issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_issues_path, :method => "post" do
      assert_select "input#web_issue_publication", :name => "web_issue[publication]"
      assert_select "input#web_issue_name", :name => "web_issue[name]"
    end
  end
end
