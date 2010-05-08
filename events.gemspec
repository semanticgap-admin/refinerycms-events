Gem::Specification.new do |s|
  s.name = "refinerycms-events"
  s.version = "0.0.1"

  s.authors = ["SemanticGap"]
  s.date = "2010-05-07"
  s.default_executable = "refinerycms-events-install"
  s.description = "A really straightforward open source Ruby on Rails events plugin designed for integration with RefineryCMS."
  s.email = "info@semanticgap.com"
  s.add_dependency "nayutaya-active-form"
  s.add_dependency "elevation_event_calendar"
  s.executables = ["refinerycms-events-install"]
  s.files = [ "db/migrate/20100430163757_create_events.rb",
              "db/migrate/20100501234548_add_color_to_events.rb",
              "db/migrate/20100502004451_add_all_day_to_events.rb",
              "app/models/calendar.rb",
              "app/models/event.rb",
              "app/controllers/events_controller.rb",
              "app/controllers/admin/events_controller.rb",
              "app/helpers/calendars_helper.rb",
              "app/views/events/index.html.erb",
              "app/views/events/show.html.erb",
              "app/views/events/_event_list.html.erb",
              "app/views/admin/events/_event.html.erb",
              "app/views/admin/events/_form.html.erb",
              "app/views/admin/events/_sortable_list.html.erb",
              "app/views/admin/events/edit.html.erb",
              "app/views/admin/events/index.html.erb",
              "app/views/admin/events/new.html.erb",
              "config/routes.rb",
              "public/stylesheets/event_calendar.css",
              "public/javascripts/event_calendar.js",
              "rails/init.rb",
              "bin/refinerycms-events-install" ]
  s.homepage = "http://github.com/semanticgap/refinerycms-events"
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = "Ruby on Rails events plugin for RefineryCMS."
end
