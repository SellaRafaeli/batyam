require "mysql2" 

@db_host  = "localhost"
@db_user  = "root"
@db_name = "fiverr_dev"

$mysql = Mysql2::Client.new(:host => @db_host, 
														:username => @db_user, 
														:password => @db_pass, 
														:database => @db_name,
														:read_timeout => 1 #secs
														)

class Mysql2::Client

	def unsafe?(q)
		q = q.downcase
		unsafe_terms = ["update","insert","alter","drop","remove"]
		unsafe_terms.include? q.downcase
	end 

	def doQuery(q)		
		#res = $mysql.query("select count(*) from users").entries[0].values[0] #hard-coded to single result
		return "illegal" if self.unsafe?(q)
		res = $mysql.query(q).entries[0].values[0] #hard-coded to single result
		puts 'got res: '+res.to_s.yellow
		res
	end

end