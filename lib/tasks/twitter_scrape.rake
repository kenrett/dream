require 'capybara'

Capybara.current_driver = :selenium
Capybara.app_host = 'http://www.twitter.com'
Capybara.ignore_hidden_elements = false

desc 'now scraping Twitter'

task :scrape_twitter => :environment do
  include Capybara::DSL

  visit("https://hire.jobvite.com/CompanyJobs/Careers.aspx?c=q8o9Vfwk&cs=91raVfwh&jvresize=https://twitter.com/jobs/jobvite_frame_resize")
  @jobs = []
  sleep(1)
  page.all('tr').each do |city|
    location = city.text if city.class == 'jobCat'
    city.all('td.jobList td a').each do |job|
      # title = loc.all('td').first.text
      title = job.text
    end
    p Job.create(:title => title, :description => nil, :location => location, :department => nil)  
  end
end


