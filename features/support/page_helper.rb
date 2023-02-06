Dir[File.join(File.dirname(__FILE__), '../page/*.rb')].sort.each {|file| require file }

module PageObjects
  def login
    LoginPage.new
  end
end
