Refinery::Plugin.register do |plugin|
  plugin.title = "Events"
  plugin.description = "Manage Events"
  plugin.version = 1.0
  plugin.activity = {
    :class => ::Event,
    :url_prefix => "edit",
    :title => 'title'
  }
end
