class AddColorToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :color, :string, :length => 16, :default => 'black'
  end

  def self.down
    remove_column :events, :color
  end
end
