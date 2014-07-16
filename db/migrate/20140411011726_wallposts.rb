class Wallposts < ActiveRecord::Migration
  def change

  	create_table :wallposts do |t|


      t.string :userid
	  t.string :groupid
      t.string :posttype
      t.string :text
      t.string :edittime


      t.timestamps

    end


  end
end

