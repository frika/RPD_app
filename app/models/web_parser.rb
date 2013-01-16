class WebParser < ActiveRecord::Base
  require 'zip/zip'
  require 'xmlrpc/client'

  	$connection = XMLRPC::Client.new('dev-www.macleans.ca', '/xmlrpc.php')
  	puts "New connection made"
  	@@wp_login = 'steventhomas'
		@@wp_pass = 'rogers08'
		$posts = []
		$one_week_from_now = Date.today + 7.days

  def self.get_authors
  	$existing_authors = []

		$connection.call('wp.getAuthors', 1, @@wp_login, @@wp_pass).each{ |author|
  		$existing_authors << author
		}
		puts "Checked authors"
  end

  def self.get_categories
  	$existing_categories = []
		$connection.call('wp.getCategories', 1, @@wp_login, @@wp_pass).each{ |taxonomy|
		  $existing_categories << taxonomy
		}
		puts "Checked categories"
  end

  def self.unzip_file(file, destination)
  	file_check = Dir.glob('public/web-issue/*.xml')
		if file_check
			file_check.each do |xml|
				File.delete(xml)
			end
		end

  	Zip::ZipFile.open(file) { |zip_file|
  		files = zip_file.select(&:file?)
  		files.reject!{|f| f.name =~ /\.DS_Store|__MACOSX|(^|\/)\._/ }
   		files.each { |f|
     		f_path=File.join(destination, f.name)
     		FileUtils.mkdir_p(File.dirname(f_path))
     		zip_file.extract(f, f_path) unless File.exist?(f_path)
   		}
  	}
  end

	def self.build_post(folder_name)
		# Start loop through XML files
		puts "starting to build posts array"
		@folders = Dir.glob('public/web-issue/*')
		regex_match = []
		@folders.each do |folder|
			if /#{folder_name}/.match(folder)
				regex_match << folder
			end
		end

		Dir.glob(regex_match.first + '/*.xml') do |rb_file|
		  xml = Nokogiri(File.read(rb_file))
		  @doc = Nokogiri::XML(File.open(rb_file))
		  puts rb_file
		# Post information
		  @hedline = @doc.xpath("//nitf/body/body.head/hedline").text.empty? ? 
		             @doc.xpath("//nitf/body/sections").text.squeeze(" ") : @doc.xpath("//nitf/body/body.head/hedline").text.squeeze(" ")
		  @content = @doc.xpath("//nitf/body/body.content").inner_html.squeeze(" ")

		  #author check
		  @author_check = @doc.xpath("//nitf/body/body.head/byline").text.empty? ? 
		                   "macleans.ca" : @doc.xpath("//nitf/body/body.head/byline").text  
		  @author_search = $existing_authors.select {|f| f["display_name"] == @author_check}
		  if @author_search.empty?
		    @author_search = $existing_authors.select {|f| f["display_name"] == "macleans.ca"}
		  end
		  @author = @author_search.first['user_id'].to_s

		  #categories	
		  file_name = rb_file.split("/").last
		  if /_int_/.match(file_name)
		  	puts "World"
		  elsif /_editor|_lett|_good|_interview/.match(file_name)
		  	puts "Week in Review"
		  elsif /_nat_/.match(file_name)
		  	puts "Canada"
		  elsif /_biz_/.match(file_name)
		  	puts "Business"
		  elsif /_soc_/.match(file_name)
		  	puts "Life"
		  elsif /_newsmak/.match(file_name)
		  	puts "Newsmakers"
		  elsif /_teitel|_wells|_amiel/.match(file_name)
		  	puts "Opinion"
		  elsif /_end/.match(file_name)
		  	puts "The End"
		  elsif /_bak_/.match(file_name)
		  	if @doc.xpath("//nitf/body/sections").text == "Film"
		  	  puts "Film"
		  	elsif @doc.xpath("//nitf/body/sections").text == "Taste"
		  		puts "Taste"
	  		elsif @doc.xpath("//nitf/body/sections").text == "Books"
		  		puts "Books"
        elsif @doc.xpath("//nitf/body/sections").text == "Bazaar"
        	puts "Bazaar"
        elsif @doc.xpath("//nitf/body/sections").text == "Art"
        	puts "Art"
        elsif @doc.xpath("//nitf/body/sections").text == "Help"
        	puts "Help"
        elsif @doc.xpath("//nitf/body/sections").text == "Architecture"
        	puts "Architecture"
        elsif @doc.xpath("//nitf/body/sections").text == "Music"
        	puts "Music"
        elsif @doc.xpath("//nitf/body/sections").text == "Travel"
        	puts "Travel"
        elsif @doc.xpath("//nitf/body/sections").text == "Web"
        	puts "Web"
        elsif @doc.xpath("//nitf/body/sections").text == "Humour"
        	puts "Humour"
        elsif @doc.xpath("//nitf/body/sections").text == "Media"
        	puts "Media"
        elsif @doc.xpath("//nitf/body/sections").text == "TV"
        	puts "TV"
        elsif @doc.xpath("//nitf/body/sections").text == "Radio"
        	puts "Radio"
        elsif @doc.xpath("//nitf/body/sections").text == "Stage"
        	puts "Stage"
        elsif @doc.xpath("//nitf/body/sections").text == "Exhibit"
        	puts "Exhibit"
        elsif @doc.xpath("//nitf/body/sections").text == "Feschuk"
        	puts "Feschuk"
        end
      else
      	puts "UNCATEGORIZED"
		  end


		# Building post object
		  @post = {
		    'title'        => @hedline,
		    'description'  => @content,
		    'wp_author_id' => @author,
		    'post_status'  => 'future',
		    'dateCreated'  => $one_week_from_now
		  }
		  $posts << @post
		end
  end

  def self.wordpress_upload
  	$posts.each do |post|
	  	$connection.call('metaWeblog.newPost', 1, @@wp_login, @@wp_pass, post, true)
		end
  end

  def self.xml_rpc(folder_name)
  	self.get_authors
  	self.get_categories
  	self.build_post(folder_name)
  end
end