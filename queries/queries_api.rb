$queries = $db.collection('queries')

namespace '/queries' do
	
	get '/all' do		
		($queries.find.to_a + $fake_queries).to_json
	end

	get '/details/:_id' do 
		$queries.findOne(params[:_id])
	end

	post '/create' do
		return {status: 401, msg: "missing params"}.to_json unless params[:query] && params[:name]
		q_data = params.slice("name","query")
		new_obj = $queries.add(q_data)
		params.merge({status: 200, id: new_obj}).to_json
	end
	
	post '/update/:_id' do
	 	$queries.update({_id: params[:_id]}, '$set' => params.slice("name","query")).to_json			 
  end

  post '/runAll' do
  	Query.runAll
  	'running all'
  end

end

def make_fake_queries 
	arr = []
	100.times do 
		arr << {
			id: rand(10000),
			name: [""].sample +
						["recommendations ", "deploys ", "new users ", "FTBs ", "purchases ", "gigs ", "security questions ", "orders "].sample + 
						["created ", "modified ", "updated ", "deleted "].sample + 
						"in last " +
						["1 ", "5 ", "10 ", "24 "].sample + 
						["minutes ", "hours ", "days "].sample,
			#query: "select * from MOCK_TABLE order by MODIFY_THIS_QUERY",			
			result: rand(100000),
			#time_ran: "2014-10-09T07:56:38.045Z"
		}
	end

# 	[
# {
# 	"_id" : "9381",
# 	"name" : "Successful Recommendations in last 10 minutes",
# 	"query" : "SELECT mock FROM foo bar",
# 	"time_ran" : ISODate("2014-10-09T07:56:38.045Z"),
# 	"result" : 250
# },

# {
# 	"_id" : "9381",
# 	"name" : "Total purchases forom paypal in last 5 minutes",
# 	"query" : "select count(*) from payment_tokens where status='success' && created_at > (DATE_SUB(NOW(), INTERVAL 5 MINUTE)) order by id desc limit 10;",
# 	"time_ran" : ISODate("2014-10-09T07:56:38.045Z"),
# 	"result" : 34
# }
# 	]
	arr
end

$fake_queries = make_fake_queries
