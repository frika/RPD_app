class ParsersController < ApplicationController
  def index

  end

  def html

  end

  def html_parse
    Parser.unzip_file(Dir.glob('public/issue/*.zip').first, 'public/issue')
  	Parser.html_parse()
    Parser.zip
  	redirect_to controller: :parsers, action: :html_index
  end

  def html_index
  	@index = Dir.glob('public/issue_html/*.html')
    @zip = Dir.glob('public/issue_html/*.zip')
  end

  def wordpress
  end

  def wordpress_parse
  end
end
