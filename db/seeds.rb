# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

project = Project.create(:name => 'Projexion', :code => 'PR', :vision => 'To be the best Scrum project management tool')

release = Release.create(:version_number => '0.9.0', :estimate_date => '2010-03-01', :project => project)

feature = Feature.create(:user_story => 'As a team member I want to be able create new feature',
               :business_value => 1000,
               :estimate_size => 'XL',
               :priority => 1,
               :acceptance_test => 'Team member should be able to insert new feature',
               :project => project,
               :release => release)

task_status = TaskStatus.create(:display_name => 'Pooled',
                                :key => 'pooled',
                                :default_status => true,
                                :color => '002aa2')

task = Task.create(:description => 'Create scaffolding for feature',
                   :feature => feature,
                   :task_status => task_status)
