class Watchers < ActiveRecord::Migration
  def change

  create_table :watchers do |t|

      t.string :userid
      t.string :groupid

      t.timestamps

    end


  end
end
