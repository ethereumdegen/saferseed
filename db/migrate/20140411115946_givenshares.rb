class Givenshares < ActiveRecord::Migration
  def change

  	create_table :givenshares do |t|

      t.string :userid
	  t.string :groupid
	  t.float :amount
      t.string :text

      t.timestamps

    end


  end
end
