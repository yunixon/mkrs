class RemoveConfirmationTokenFromUsers2 < ActiveRecord::Migration
  def change
  	    change_table(:users) do |t|
       # Confirmable
       t.remove   :confirmation_token
       t.remove :confirmed_at
       t.remove :confirmation_sent_at
       t.remove   :unconfirmed_email # Only if using reconfirmable
     end
  end
end
