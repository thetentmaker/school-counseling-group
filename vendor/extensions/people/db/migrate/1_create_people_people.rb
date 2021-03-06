class CreatePeoplePeople < ActiveRecord::Migration

  def up
    create_table :refinery_people do |t|
      t.string :name
      t.text :content
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-people"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/people/people"})
    end

    drop_table :refinery_people

  end

end
