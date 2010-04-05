class Meeting < ActiveRecord::Base
  belongs_to :project
  belongs_to :sprint
  belongs_to :meeting_type

  before_create :set_created_by

  validates_presence_of :start_time, :end_time

  def set_created_by
    self.created_by = UserSession.current_user.login
  end
end