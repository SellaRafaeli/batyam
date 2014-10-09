require "mysql2" 
require 'net/ssh/gateway'

@db_host  = "localhost" 
@db_user  = "root"
@db_name = "fiverr_dev"

if $production
	@db_host = ENV['db_host']
	@db_user = ENV['db_user']
	@db_pass = ENV['db_pass']
	@db_name = ENV['db_name']	
	ssh_server = ENV['ssh_server']
	ssh_user = ENV['ssh_user']	
	gateway = Net::SSH::Gateway.new(ssh_server,ssh_user)  
	port = gateway.open(@db_host,3306,3309)
end

opts = {
		:host => '127.0.0.1',
		:username => @db_user, 
		:password => @db_pass, 
		:database => @db_name,
		:read_timeout => 1 #secs
}

if $production 
	opts[:port] = port
end 

$mysql = Mysql2::Client.new(opts)
														
class Mysql2::Client

	def unsafe?(q)
		q = q.downcase
		unsafe_terms = ["update","insert","alter","drop","remove"]
		unsafe_terms.include? q.downcase
	end 

	def doQuery(q)		
		#res = $mysql.query("select count(*) from users").entries[0].values[0] #hard-coded to single result
		return "illegal" if self.unsafe?(q)
		$mysql.query(q).entries[0].values[0] #hard-coded to single result		
	end

end