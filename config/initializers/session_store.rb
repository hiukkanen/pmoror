# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pmoror_session',
  :secret      => 'c26981ef855ec5419267c5293890a49c155716fdc6a8585b26e3595109e762fc5a03977c4bec8b9c24df757e6c4d7b44068503b05364e5ae8ddf083896037d78'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
