class CreateUrlMaps < ActiveRecord::Migration
  def self.up
    create_table :url_maps do |t|
      t.string :short_url
      t.string :long_url
      t.timestamps
    end
  end

  def self.down
    drop_table :url_maps
  end
end
