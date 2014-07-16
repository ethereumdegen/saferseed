class Members < ActiveRecord::Migration
  def change

  	  create_table :members do |t|

      t.string :userid
      t.string :groupid

      t.timestamps

    end



  end
end
