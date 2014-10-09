BATYAM is a simple, collaborative dashboard for business queries. 

Batyam is an interface for business queries - creation, updating, and filtering of queries and results, as well as periodic execution in the background (TBD). 

# Install

    $ git clone git@github.com:SellaRafaeli/batyam.git
    $ cd batyam; bundle install 
    $ shotgun -d -p 9393

And browse to http://localhost:9393/.

To run against a remote database (via ssh hop):
    
    $ production=true db_host='your-sql-host' db_pass='password' db_user='user' db_name='name' ssh_server='server' ssh_user='user' rackup -p 9393; 
   

# Use:

# Upcoming:
- Periodic execution in background of queries (without manual execution)
- Periodic refreshing of data in client, to display live data always
- Support queries on multiple databases

Batyam currently supports only MySQL queries against a single DB. 

# License:
Batyam is available under the MIT license. 
