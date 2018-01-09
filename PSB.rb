require 'net/http'

# Secure Proxy Control
# 1-) Proxy is up?
# 2-) Is proxy modify javascript content?
# 3-) Is proxy modify html file content?


# Input_file includes proxy list

input_file = ARGV[0]

File.foreach(input_file.to_s).with_index do |line, line_num|
   proxy_ip = line.split(" ")[0]
   proxy_port = line.split(" ")[1]
   proxy = Net::HTTP::Proxy(proxy_ip,proxy_port)
   url = URI.parse('http://www.bishopfox.com/files/tools/googlediggity/other/Fhqwhgads.txt')
   req = Net::HTTP::Get.new(url.to_s, {'User-Agent' => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 ( .NET CLR 3.5.30729)'})
   res = proxy.start(url.host, url.port) {|http|
       http.request(req)
       }
   if res.body.include? "everybody2daLim1t"
      puts "Proxy IP: " + proxy_ip + " Proxy_port: " + proxy_port + " is secure" 
   end
end
