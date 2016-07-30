require 'omnicontacts'

    Rails.application.middleware.use OmniContacts::Builder do
        importer :gmail, "514007016287-jtjlg2d6ekbd3qrlpeae09hbjq60bdub.apps.googleusercontent.com", "SgSXzH8gnqxv0YazADNokyhx", {:redirect_path => "/oauth2callback", :ssl_ca_path => "/etc/ssl/certs/curl-ca-bundle.crt"}
        importer :yahoo, "dj0yJmk9WVZFM2hWWFUyRFFyJmQ9WVdrOWREZ3lha2t6TTJNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD0zNA--", "d7d1a2719c912061d5342257f66bbeae4658d881", {:callback_path => '/callback'}
       # importer :facebook, "274484366233442", "feacd9b41640c140d0ca0587ef3023cd"
    end