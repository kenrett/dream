require 'csv'

desc "Now scraping from Facebook.com"

task :scrape_fb => :environment do 

	# initialize mechanize

	agent = Mechanize.new

	jobs = {}

	urls = ["https://www.facebook.com/careers/search?q=&location=menlo-park"]


	urls.each do |url|
		link = agent.get(url)
		dept = div['class="_6q _6u"'].text
		binding.pry
    if jobs[dept]
      jobs[dept] << link
    else
      jobs[dept] = [link]
    end
	end
	
end