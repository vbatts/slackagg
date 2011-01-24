class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.column :title, :string, :limit => 2048
      t.column :uri, :string, :limit => 2048
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
