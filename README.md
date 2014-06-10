assassins
=========

A web application to create, manage, and play games of Assassins

Instructions to run:
In db/migrate/load_data.rb, add an admin user to the file (e.g. current admins are jessica and simon)

To change the email that Assassins sends with:
Go to app/mailers/user_mailer.rb, change "jro.assassins@gmail.com" to whatever email you want to use.
(Make sure to make the same changes in the rules!)

Reset the database on heroku, and you're all set!
