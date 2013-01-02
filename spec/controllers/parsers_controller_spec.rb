require 'spec_helper'

describe ParsersController do

  describe "GET 'html'" do
    it "returns http success" do
      get 'html'
      response.should be_success
    end
  end

  describe "GET 'wordpress'" do
    it "returns http success" do
      get 'wordpress'
      response.should be_success
    end
  end

end
