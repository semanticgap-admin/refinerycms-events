module EventsHelper
  def datetime(d)
    I18n.localize(d, :format => "%B %d, %Y %l:%M %p")
  end

  def date(d)
    I18n.localize(d, :format => "%B %d, %Y")
  end

  def time(d)
    I18n.localize(d, :format => "%l:%M%p")
  end

  def month_link(date)
    link_to(I18n.localize(date, :format => "%B"), {:date => date})
  end
  
  # custom options for this calendar
  def event_calendar_opts(calendar)
    { 
      :year => @calendar.year,
      :month => @calendar.month,
      :event_strips => @calendar.event_strips,
      :month_name_text => I18n.localize(@calendar.date, :format => "%B %Y"),
      :previous_month_text => month_link(@calendar.date.last_month),
      :next_month_text => month_link(@calendar.date.next_month),
      :use_all_day => true
    }
  end

  def timed_title(event)
    "#{time(event.start_at)} #{h(event.title)}"
  end

  def event_title(event)
    if event.all_day?
      h(event.title)
    else
      timed_title(event)
    end
  end

  def event_calendar(calendar)
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts(calendar) do |args|
      event = args[:event]
      title = event.all_day?? h(event.title) : timed_title(event)
      link_to(title, event_path(event))
    end
  end

  def event_list(options = Hash.new)
    grouped_events = Event.
      all(:limit => options.fetch(:limit) { 10 }, :order => 'start_at ASC',
          :conditions => [ 'start_at >= ? || end_at >= ?', Time.now, Time.now ]).
      group_by { |e| e.start_at.to_date }

    render(:partial => '/events/event_list',
           :object => grouped_events,
           :locals => { :heading => options[:heading],
                        :see_more_link => options.fetch(:see_more_link) { 'View the calendar' } } )
  end
end
