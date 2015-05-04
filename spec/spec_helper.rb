require("rspec")
require('pry')
require('contact')
require('phone')
require('address')
require('email')
require('pg')

DB = PG.connect(dbname: 'address_book_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM addresses *;")
    DB.exec("DELETE FROM phones *;")
    DB.exec("DELETE FROM emails *;")
    DB.exec("DELETE FROM contacts *;")
  end
end
