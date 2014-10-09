$queries = $db.collection('queries')

namespace '/queries' do
	
	get '/all' do		
		$queries.find.to_a.to_json
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

