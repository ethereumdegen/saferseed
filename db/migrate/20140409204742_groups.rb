class Groups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

      t.string :email
      t.string :name
      t.string :uid

      t.timestamps

    end

  end
end
