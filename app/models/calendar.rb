class Calendar
  def initialize(date)
    @date = date
  end

  def events
    event_strips.flatten.compact
  end

  def event_strips
    Event.event_strips_for_month(@date)
  end

  attr_reader :date
  delegate :month, :year, :to => :date
end
