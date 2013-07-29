require 'capybara'

Capybara.current_driver = :selenium
Capybara.app_host = 'http://www.facebook.com'
Capybara.ignore_hidden_elements = false

desc 'now scraping Facebook'

task :scrape_facebook => :environment do
	include Capybara::DSL

	visit("https://www.facebook.com/careers/search?q=&location=menlo-park")
	sleep(3)
  	@jobs       = []
	@job_titles = []
	@job_depts  = []
	@job_locs   = []
  	@hrefs      = []

  page.all('.-cx-PRIVATE-fbMarketingText__regular a').each do |job|
    @job_titles << job.text
  end

	page.all('.-cx-PRIVATE-fbMarketingText__light').each do |dept|
		@job_depts << dept.text
	end

  page.all('.pvm.-cx-PRIVATE-FreightSansFont__regular.-cx-PRIVATE-fbMarketingText__small.-cx-PRIVATE-fbMarketingText__normal.-cx-PRIVATE-fbMarketingText__regular').each do |loc|
		@job_locs << loc.text
	end

  binding.pry
  page.all('.-cx-PRIVATE-fbMarketingText__regular a').each do |href|

  end
	
 #  @job_depts.shift
	# @jobs = @job_titles.zip(@job_depts, @job_locs)

	# @jobs.each_slice(3).to_a 

 #  @jobs.each do |job|
 #    title = job[0]
 #    department = job[1]
 #    location = job[2]
 #    p Job.create(:title => title, :department => department, :location => location, :description => "None given")
 #  end


end