class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :uid
			t.string :provider
			t.string :oauth_token
			t.string :name
			t.string :email
			t.string :secret
			t.text :details
			t.datetime :oauth_expires_at
			t.timestamps null: false
		end
	end
end

