class InitDb < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :avatar_ur
      t.timestamps
    end

    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :img_url
      t.boolean :is_public
      t.timestamps
    end

    create_table :albums do |t|
      t.string :title
      t.string :description
      t.boolean :is_public
      t.timestamps
    end


    create_table :album_images do |t|
      t.string :img_url
    end

    create_table :follower do |t|

    end

    create_table :following do |t|

    end



  end
end
