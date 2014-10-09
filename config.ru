#config
$app_name   = 'batyam'
$production = (ENV['production'] == 'true')

require './app'
run Sinatra::Application

