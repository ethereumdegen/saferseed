class Privatemessages < ActiveRecord::Migration
  def change

  	create_table :privatemessages do |t|

      t.string :sendinguserid
	  t.string :receivinguserid
	  t.string :messagetype
      t.string :text

      t.timestamps

    end


  end
end
