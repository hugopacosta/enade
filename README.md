# README

Step-by-step guide to get the ENADE performance list up and running locally:

( Windows )
* Download and install the latest RailsInstaller, found on http://railsinstaller.org/pt-BR

( Linux and MacOS )
* Download and install Ruby 2.3.3, found on https://www.ruby-lang.org/en/news/2016/11/21/ruby-2-3-3-released/
* Download and install Ruby on Rails, found on https://weblog.rubyonrails.org/releases/
* Download and install PostgreSQL, found on https://www.postgresql.org/download/
* Download and install Git, found on https://git-scm.com/

Make sure everything is running smoothly before you proceed!

Create the folder where you are going to clone this repository and enter this command line from inside it:

$ git clone https://github.com/hugopacosta/enade.git

Change directory to the newly created "enade" folder and type in the following commands:

$ rails db:migrate

Wait until the migration is completed, and finally type in:

$ rails server

Everything is set!

To access the application enter this URL on your favorite browser: http://localhost:3000/
