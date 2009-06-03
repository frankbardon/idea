# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_idea_session',
  :secret      => 'ffe97fbaf75692218b0109b52f1a52355c7132c8dca0c6e4a9c660f126bacf67ddf0c8c86e978dd85b71df8ad096a4927d96b48baf9ca72e1ce263bbe73a162c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
