Web Messenger
=================

Setup
-----------------

1. Install dependencies: `bundle install`
2. Run database migrations: `rake db:migrate`

Use
----------------- 

1. Start application server: `rails server`
2. Start server for realtime messaging (thin should be started at production environment): `rackup private_pub.ru -s thin -E production`
3. Open http://localhost:3000 in browser #1 and in browser #2. These should be different browsers/tabs that do not share coockies :) 
4. Enter a unique user name in each browser and begin chatting!
