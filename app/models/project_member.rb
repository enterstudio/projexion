class ProjectMember
  include Mongoid::Document
  include Mongoid::Timestamps

  ACTIVE = 'A'
  INACTIVE = 'I'

  field :status

  referenced_in :project_role
  referenced_in :user
  referenced_in :project

#  belongs_to :user
#  belongs_to :project
#  belongs_to :project_role
#
  validates_presence_of :user, :project, :project_role
#  validate :only_one_manager_per_project
#
#  def only_one_manager_per_project
#    if self.project_role.eql? ProjectRole.manager and self.project.manager_exists?
#      errors.add(:manager, "role for #{self.project.name} already exists")
#    end
#  end
end