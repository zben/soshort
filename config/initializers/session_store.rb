# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shortener_session',
  :secret      => '68b21f99c549c3d963ac9b82eb902464d83266d669c118b40380b1284acd7ae018d5bd907bb8bb95a3cd0aeccf2d3d9b5aa598ec5fc4276babc19a5e4f663a04'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
