class AddTagUrlTable < ActiveRecord::Migration
  def self.up
    create_table :tags_url_maps,:id => false do |t|
      t.integer :tag_id
      t.integer :url_map_id
      t.timestamps
    end
  end

  def self.down
      drop_table :tags_url_maps
  end
end

