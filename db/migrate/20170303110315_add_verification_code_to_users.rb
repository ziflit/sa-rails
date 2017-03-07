class AddVerificationCodeToUsers < ActiveRecord::Migration[5.0]
    def change
        add_column :users, :verification_code, :string, null: false
    end
end