module Query
	extend self

	def runAll 
		puts 'running all queries'.yellow		
		$queries.find.each { |q| 
			res = $mysql.doQuery(q.query)
			results = {
				time_ran: Time.now,
				result: res
			}
			$queries.update( {_id:q._id}, '$set' => results ) 
		}		
	end

end