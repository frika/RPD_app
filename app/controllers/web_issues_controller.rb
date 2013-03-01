class WebIssuesController < ApplicationController
  # GET /web_issues
  # GET /web_issues.json
  def index
    @web_issues = WebIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @web_issues }
    end
  end

  # GET /web_issues/1
  # GET /web_issues/1.json
  def show
    @web_issue = WebIssue.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @web_issue }
    end
  end

  def xml_rpc
    @web_issue = WebIssue.find(params[:id])
    WebParser.unzip_file(Dir.glob('public' + @web_issue.asset.url.split('?')[0]).first, 'public/web-issue')
    WebParser.xml_rpc(@web_issue.publication, @web_issue.asset.url.split("/").last.split(".").first, params[:wordpress_url], params[:login_name], params[:access_pw])
    redirect_to @web_issue, notice: 'Web issue was successfully created.'
  end

  # GET /web_issues/new
  # GET /web_issues/new.json
  def new
    @web_issue = WebIssue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @web_issue }
    end
  end

  # GET /web_issues/1/edit
  def edit
    @web_issue = WebIssue.find(params[:id])
  end

  # POST /web_issues
  # POST /web_issues.json
  def create
    @web_issue = WebIssue.new(params[:web_issue])

    if @web_issue.save
      
      redirect_to @web_issue, notice: 'Web issue was successfully created.'
    else
      render action: "new"
    end
    
  end

  # PUT /web_issues/1
  # PUT /web_issues/1.json
  def update
    @web_issue = WebIssue.find(params[:id])

    respond_to do |format|
      if @web_issue.update_attributes(params[:web_issue])
        format.html { redirect_to @web_issue, notice: 'Web issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @web_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_issues/1
  # DELETE /web_issues/1.json
  def destroy
    @web_issue = WebIssue.find(params[:id])
    @web_issue.destroy

    respond_to do |format|
      format.html { redirect_to web_issues_url }
      format.json { head :no_content }
    end
  end
end
