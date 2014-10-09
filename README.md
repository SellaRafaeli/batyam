BATYAM is a simple, collaborative dashboard for business queries. 

# Install

    $ git clone git@github.com:SellaRafaeli/batyam.git
    $ cd batyam; bundle install 

# Run:
Against local database:
    
    $ shotgun -d -p 9393; python -mwebbrowser http://localhost:9393/

Against production database (via ssh hop):
    
    $ production=true db_host='your-sql-host' db_pass='password' db_user='user' db_name='name' ssh_server='server' ssh_user='user' rackup -p 9393; 
    
And browse to http://localhost:9393/.

# Use:
Batyam allows easy creation, updating, and filtering of queries and results. To see results, execute the queries manually and refresh the page. 

# Support:
Batyam currently supports only MySQL queries against a single DB. 

# License:
Batyam is available under the MIT license. 
