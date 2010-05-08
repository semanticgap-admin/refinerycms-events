class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start_at
      t.datetime :end_at
      t.integer :position

      t.timestamps
    end

    add_index :events, :id

    User.find(:all).each do |user|
      user.plugins.create(:title => "Events", :position => (user.plugins.maximum(:position) || -1) +1)
    end

    page = Page.create(
      :title => "Events",
      :link_url => "/events",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => "parent_id IS NULL") || -1)+1),
      :menu_match => "^/events(\/|\/.+?|)$"
    )
    RefinerySetting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end

  def self.down
    UserPlugin.destroy_all({:title => "Events"})

    Page.find_all_by_link_url("/events").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/events"})

    drop_table :events
  end

end
