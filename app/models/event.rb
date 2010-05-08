require 'semanticgap_date_time_form'

class Event < ActiveRecord::Base
  has_event_calendar
  datetime_fields_for :start_at
  datetime_fields_for :end_at

  acts_as_indexed :fields => [:title, :description, :location],
                  :index_file => [Rails.root.to_s, "tmp", "index"]

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_format_of :color, :with => /(black|white|gr[ae]y|red|yellow|green|cyan|blue|magenta|\#[A-Fa-f0-9]{3,6})/, :allow_blank => true

  def dated_title
    "#{I18n.localize(start_at.to_date)}: #{title}"
  end

  def timed_title
    "#{I18n.localize(start_at, "")}: #{title}"
  end

  def color
    c = attributes['color']
    c.blank?? 'black' : c
  end
end
