class EventsController < ApplicationController

  before_filter :find_page

  def index
    @date = Date.parse(params[:date]) rescue Date.today
    @calendar = Calendar.new(@date)
    present(@page)
  end

  def show
    @event = Event.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@event)
  end

protected

  def find_page
    @page = Page.find_by_link_url("/events")
  end

end
