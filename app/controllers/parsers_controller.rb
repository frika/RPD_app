class ParsersController < ApplicationController
  def html

  end

  def html_parse
  	Parser.html_parse
  	redirect_to controller: :parsers, action: :html
  end

  def wordpress
  end

  def wordpress_parse
  end
end
