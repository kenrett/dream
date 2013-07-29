require 'capybara'

Capybara.current_driver = :selenium
Capybara.app_host = 'http://www.google.com'
Capybara.ignore_hidden_elements = false

desc 'now scraping google Mountain View'

task :scrape_google => :environment do
  include Capybara::DSL

  1.upto(64) do |num|
    visit("https://www.google.com/about/jobs/search/#t=sq&q=j&li=10&st=#{(num-1)*10}&jl=37.3860517%253A-122.0838511%253AMountain+View%252C+CA%252C+USA%253Anull%253Anull%2526&na=JOBS_SEARCH&")
    sleep(3)
    @jobs = []
    page.all('div[class="sr-content"]').each do |x|
      @jobs << x
    end  

    @jobs.each do |job|
      title = job.find('span[itemprop="name title"]').text
      description = job.find('div[itemprop="description"]').text
      department = job.find('div[class="greytext sr-filters"]').text
      links = job.all('a').first[:href]
      job.all('a[class="source"]').each do |loc|
        p Job.create(:title => title, :description => description, :location => loc.text, :department => department, :links => links)
      end
    end
  end

desc 'now scraping google San Francisco'

  1.upto(5) do |num|
    visit("https://www.google.com/about/jobs/search/#t=sq&q=j&li=10&st=#{(num-1)*10}&jl=37.7749295%253A-122.4194155%253ASan+Francisco%252C+CA%252C+USA%253AUS%253AUnited+States%2526&na=JOBS_SEARCH&")
    sleep(3)
    @jobs = []
    page.all('div[class="sr-content"]').each do |x|
      @jobs << x
    end 
   
    @jobs.each do |job|
      title = job.find('span[itemprop="name title"]').text
      description = job.find('div[itemprop="description"]').text
      department = job.find('div[class="greytext sr-filters"]').text
      links = job.all('a').first[:href]
      job.all('a[class="source"]').each do |loc|
        p Job.create(:title => title, :description => description, :location => loc.text, :department => department, :links => links)
      end
    end
  end

desc 'now scraping google San Bruno'
p 'now scraping google San Bruno'

  1.upto(5) do |num|
    visit("https://www.google.com/about/jobs/search/#t=sq&q=j&li=10&st=#{(num-1)*10}&jl=37.6304904%253A-122.4110835%253ASan+Bruno%252C+CA%252C+USA%253AUS%253AUnited+States%2526&na=JOBS_SEARCH&")
    sleep(3)
    @jobs = []
    page.all('div[class="sr-content"]').each do |x|
      @jobs << x
    end 
   
    @jobs.each do |job|
      title = job.find('span[itemprop="name title"]').text
      description = job.find('div[itemprop="description"]').text
      department = job.find('div[class="greytext sr-filters"]').text
      links = job.all('a').first[:href]
      job.all('a[class="source"]').each do |loc|
        p Job.create(:title => title, :description => description, :location => loc.text, :department => department, :links => links™)
      end
    end
  end
end