class Parser < ActiveRecord::Base
	require 'zip/zip'
	
# Helper methods
	def self.file_operations(rb_file, xslt, xml, folder_name) # renames and saves .html file
		name = rb_file.gsub("public/issue/" + folder_name, "public/issue_html/").split(".").first + ".html"
		file = File.new(name, "w")
		file.write(xslt.transform(xml).to_html)
		file.close
	end
	def self.unzip_file(file, destination)
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
  def self.scan_XML
  	Dir.glob('public/*.xml') do |rb_file|
  		xml = Nokogiri(File.read(rb_file))
		@doc = Nokogiri::XML(File.open(rb_file))
		puts "working on: " + rb_file + " - standard"
		xslt = Nokogiri::XSLT(File.read("public/xsl/standard_article.xsl"))
		file = File.new("public/test.html", "w")
		file.write(xslt.transform(xml).to_html)
		file.close
	end
  end
# Check to see if a zip file already exists, if so, delete it and create a new one
	def self.zip(folder_name, issue_name) 
		zip = Dir.glob('public/issue_html/*.zip')
	    if zip
	      zip.each do |zip|
	        File.delete(zip)
	      end
	    end
		folder = 'public/issue_html'
		files = Dir.glob('public/issue_html/*.html')
		images_folder = Dir.glob('public/issue/' + folder_name + '/images/*')
		Zip::ZipFile.open('public/issue_html/' + issue_name + '.zip', Zip::ZipFile::CREATE) do |zipfile|
  		files.each do |filename|
    		zipfile.add(filename.gsub('public/issue_html/', ""), filename)
  		end
  		images_folder.each do |imagename|
  			zipfile.add(imagename.gsub('public/issue/' + folder_name + '/', ''), imagename)
  		end
		end
	end

# Combines all XML files and creates Table of contents from aggregate
	def self.toc(folder_name, pub)
		file_check = Dir.glob('public/issue_html/*.html')
		if file_check
			file_check.each do |html|
				File.delete(html)
			end
		end
		comb_xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/comb.xsl"))
		comb = File.new('public/issue/' + folder_name + '/master.xml', 'w')
		comb.write('<catalog>')
		files = Dir.glob('public/issue/' + folder_name + '/*.xml').sort_by { |file| file }
		files.each do |rb_file|
			comb.write('<article>')
		  xml = Nokogiri(File.read(rb_file))
		  @doc = Nokogiri::XML(File.open(rb_file))
		  comb.write(comb_xslt.transform(xml).to_html)
		  comb.write('</article>')
		end 
		comb.write('</catalog>')
		comb.close
		toc_xml = Nokogiri(File.read('public/issue/' + folder_name + '/master.xml'))
		toc_xslt = Nokogiri::XSLT(File.read("public/xsl/#{pub}/toc.xsl"))
		toc = File.new('public/issue_html/02_contents.html', 'w')
		toc.write(toc_xslt.transform(toc_xml).to_html)
		toc.close
	end

# Main parsing method for all articles
  def self.articles(folder_name, pub) 
  	Dir.glob('public/issue/**/*.xml') do |rb_file|
			xml = Nokogiri(File.read(rb_file))
			@doc = Nokogiri::XML(File.open(rb_file))
			
# Choosing which template selector to use based on the publication
# Template selector found in app/models/template_selector.rb
			if pub == "MAC"
				template = TemplateSelector.mac(@doc, rb_file, pub)
			elsif pub == "CB"
				template = TemplateSelector.cb(@doc, rb_file, pub)
			elsif pub == "MS"
				template = TemplateSelector.ms(@doc, rb_file, pub)
			end

			self.file_operations(rb_file, template, xml, folder_name)
		end
	end

# Master method for executing all of the above to create an issue
	def self.html_parse(folder_name, pub) 
		self.toc(folder_name, pub)
		self.articles(folder_name, pub)
	end 	
end
