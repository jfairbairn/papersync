require 'net/https'
require 'uri'
require 'cgi'
class PaperSync
  class Credentials
    attr_reader :username, :password
    def initialize
      credpath = File.join(ENV['HOME'], '.papersync')
      @username, @password = eval(File.read(credpath))
    end
  end
  
  def initialize(credentials, destdir)
    @credentials, @destdir = credentials, destdir
  end
  
  def fetch
    auth_uri = URI.parse("https://www.instapaper.com/user/login")
    http = Net::HTTP.new(auth_uri.host, auth_uri.port)
    http.use_ssl=true
    res = http.start do |h|
      h.post("#{auth_uri.path}?#{auth_uri.query}", "username=#{CGI.escape(@credentials.username)}&password=#{CGI.escape(@credentials.password)}")
    end
    cookies = res['set-cookie'].split(',').map(&:strip)
    http = Net::HTTP.new('www.instapaper.com', 80)
    res = http.start do |h|
      req = Net::HTTP::Get.new('/mobi')
      req['cookie'] = cookies.map{|i|i.split(';').first}.join(';')
      h.request(req)
    end
    File.open(File.join(@destdir, 'instapaper.mobi'), 'wb') {|f|f.write(res.body)}
  end
end