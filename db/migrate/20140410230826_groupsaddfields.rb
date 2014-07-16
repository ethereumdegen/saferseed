class Groupsaddfields < ActiveRecord::Migration
  def change

  	create_table :groups do |t|


      t.string :name
	  t.string :location
      t.string :webaddress
      t.string :email
      t.string :imageurl
      t.string :uid

     

      t.timestamps

    end


  end
end
