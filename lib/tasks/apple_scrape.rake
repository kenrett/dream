require 'capybara'

Capybara.current_driver = :selenium
Capybara.app_host = 'http://www.apple.com'
Capybara.ignore_hidden_elements = false

desc 'now scraping Apple - Santa Clara Valley'

task :scrape_apple => :environment do
  include Capybara::DSL

  30.times do
    visit("https://jobs.apple.com/us/search?jobFunction=SFWEG#location&t=0&sb=req_open_dt&so=1&j=SFWEG&lo=3*SCV*USA*953*SCV*Santa Clara Valley&pN=0")
    sleep(2)
    @jobs = []
    page.all('tr[class="searchresult"]').each do |x|
      # p x
      @jobs << x
      # p 'Here is the jobs hash' + "#{@jobs}"
    end  
    # p "<<<<<<<<<<<<<#{@jobs}>>>>>>>>>>>>>>"
    @jobs.each do |job|
      # binding.pry
      link_number = job.all('a').first[:id].scan(/\d/).join
      title = job.find('a').text
      description = job.all('td[class="detail"]')[0].text
      links = "https://jobs.apple.com/us/search?jobFunction=SFWEG#location&t=0&sb=req_open_dt&so=1&j=SFWEG&lo=3*SCV*USA*953*SCV*Santa%20Clara%20Valley&pN=0&openJobId=#{link_number}"
      location = job.all('td[class="detail"]')[1].text
      # post_date = job.all('td[class="detail"]')[2].text
      
      p Job.create(:title => title, :links => links, :description => description, :location => location, :department => nil)
    end
    find(:xpath, "//*[@id='resultsDiv']/div[2]/div[1]/ul/li[2]/a[2]").click
  end
end