class Admin::EventsController < Admin::BaseController
  crudify :event, :title_attribute => :title, :sortable => false, :order => 'start_at DESC'

end
