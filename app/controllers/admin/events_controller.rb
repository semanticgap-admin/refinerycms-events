class Admin::EventsController < Admin::BaseController
  helper :calendars
  crudify :event, :title_attribute => :title, :sortable => false, :order => 'start_at DESC'

end
