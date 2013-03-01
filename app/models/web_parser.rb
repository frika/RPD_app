class WebParser < ActiveRecord::Base
 
	require 'zip/zip'
	require 'xmlrpc/client'


	def self.wordpress_init(url, username, password)
		
		$connection = XMLRPC::Client.new(url, '/xmlrpc.php')
		$connection.http_header_extra = {"Content-Type"   => "text/xml; charset=utf-8"}
		#puts "New connection made"
		$wp_login = username
		$wp_pass = password
		$posts = []
		$one_week_from_now = Date.today + 7.days
	end

	def self.get_authors(pub)
		$existing_authors = []
		if pub == "CB"
			$connection.call('wp.getUsers', 1, $wp_login, $wp_pass, {'role' => 'administrator'}).each { |author|
			$existing_authors << author
		}
		$connection.call('wp.getUsers', 1, $wp_login, $wp_pass, {'role' => 'contributor'}).each { |author|
			$existing_authors << author
		}
	else
		$connection.call('wp.getAuthors', 1, $wp_login, $wp_pass).each { |author|
			$existing_authors << author
		}
	end
		#puts "Checked authors"
	end
	
	def self.default_author(pub)
		if pub == "MAC"
			return "macleans.ca"
		elsif pub == "CB"
			return "CB Staff"
		elsif pub == "MS"
			return "MoneySense"	
		end
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

	def self.build_post(folder_name, pub)
		# Start loop through XML files
		#puts "starting to build posts array"
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
			#puts rb_file
		# Post information
			unless @doc.xpath("//nitf/body/sections").text == "Books"
				@hedline = @doc.xpath("//nitf/body/body.head/hedline").text.empty? ? 
									 @doc.xpath("//nitf/body/sections").text.squeeze(" ") : @doc.xpath("//nitf/body/body.head/hedline").text.squeeze(" ")
			else 
				@hedline = @doc.xpath("//nitf/body/body.head/hedline").text.titleize.squeeze(" ")
				if @hedline.upcase == @hedline
					@hedline = 'Review: ' + @hedline.titleize
				end
			end
			#puts @hedline
			@content = @doc.xpath("//nitf/body/body.content").inner_html.squeeze(" ")
			@abstract = @doc.xpath("//nitf/body/body.head/abstract").text.squeeze(" ")
			#author check
			@author_check = @doc.xpath("//nitf/body/body.head/byline").text.empty? ? 
											 "macleans.ca" : @doc.xpath("//nitf/body/body.head/byline").text  
			@author_search = $existing_authors.select {|f| /#{f["display_name"].titleize}/.match(@author_check.titleize)}
			#puts @author_search.count.to_s + "Author search"
			if @author_search.empty?
				@author_search = $existing_authors.select {|f| f["display_name"] == WebParser.default_author(pub)}
			end
			@author = @author_search.first['user_id']

			#categories	
			file_name = rb_file.split("/").last
			if /_int_/.match(file_name)
				@category = ["World"]
			elsif /_editor|_lett|_interview/.match(file_name)
				@category = ["Week in Review"]
			elsif /_good/.match(file_name)
				@category = ["Good news, bad news"]
			elsif /_nat_/.match(file_name)
				@category = ["Canada"]
			elsif /_biz_/.match(file_name)
				@category = ["Business"]
			elsif /_soc_/.match(file_name)
				@category = ["Life"]
			elsif /_newsmak/.match(file_name)
				@category = ["Newsmakers"]
			elsif /_teitel|_wells|_amiel/.match(file_name)
				@category = ["Opinion"]
			elsif /_end/.match(file_name)
				@category = ["The End"]
			elsif /_bak_/.match(file_name)
				if @doc.xpath("//nitf/body/sections").text == "Film"
					@category = ["Film"]
				elsif @doc.xpath("//nitf/body/sections").text == "Taste"
					@category = ["Food"]
				elsif @doc.xpath("//nitf/body/sections").text == "Books"
					@category = ["Books", "Bookmarked"]
				elsif @doc.xpath("//nitf/body/sections").text == "Bazaar"
					@category = ["Arts"]
				elsif @doc.xpath("//nitf/body/sections").text == "Art"
					@category = ["Arts"]
				elsif @doc.xpath("//nitf/body/sections").text == "Help"
					@category = ["Help"]
				elsif @doc.xpath("//nitf/body/sections").text == "Architecture"
					@category = ["Arts"]
				elsif @doc.xpath("//nitf/body/sections").text == "Music"
					@category = ["Music"]
				elsif @doc.xpath("//nitf/body/sections").text == "Travel"
					@category = ["Travel"]
				elsif @doc.xpath("//nitf/body/sections").text == "Web"
					@category = ["Arts"]
				elsif @doc.xpath("//nitf/body/sections").text == "Humour"
					@category = ["Humour"]
				elsif @doc.xpath("//nitf/body/sections").text == "Media"
					@category = ["Media"]
				elsif @doc.xpath("//nitf/body/sections").text == "TV"
					@category = ["TV"]
				elsif @doc.xpath("//nitf/body/sections").text == "Radio"
					@category = ["Media"]
				elsif @doc.xpath("//nitf/body/sections").text == "Stage"
					@category = ["Theatre"]
				elsif @doc.xpath("//nitf/body/sections").text == "Exhibit"
					@category = ["Arts"]
				elsif @doc.xpath("//nitf/body/sections").text == "Feschuk"
					@category = ["Scott Feschuk"]
				end
				else
					@category = ["Uncategorized"]
					#puts "Categorized"
			end
#puts "Finished categories stuff"
		# Building post object
		if pub == "CB"
			@post = {
					'post_title'        => @hedline,
					'post_content'  => @content,
					'post_author' => @author,
					'post_excerpt'   => @abstract,
					'post_type'    => "post",
					'post_status'  => 'draft',
				}
			$posts << @post
		else
			@post = {
				'title'        => @hedline,
				'description'  => @content,
				'wp_author_id' => @author,
				'mt_excerpt'   => @abstract,
				'post_type'    => "post",
				'post_status'  => 'future',
				'categories' => @category,
				'dateCreated'  => $one_week_from_now
			}
			$posts << @post
		end
			
		end
	end

	def self.wordpress_upload(pub)
	if pub == "CB"
		$posts.each do |post|
		#	puts post['post_author']
			begin
				$connection.call('wp.newPost', 1, $wp_login, $wp_pass, post)
				puts "Finished a post"
			rescue XMLRPC::FaultException => e
			  puts "Error: "
			  puts e.faultCode
			  puts e.faultString
			end
		end
	else
		$posts.each do |post|
			$connection.call_async('metaWeblog.newPost', 1, $wp_login, $wp_pass, post, true)
		end
	end
		
	end

	def self.xml_rpc(pub, folder_name, url, username, password)
		self.wordpress_init(url, username, password)
		self.get_authors(pub)
		self.build_post(folder_name, pub)
		self.wordpress_upload(pub)
	end
end