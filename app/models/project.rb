# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  description       :text
#  begin_time        :datetime
#  end_time          :datetime
#  location          :string(255)
#  supplies_required :text
#  children_allowed  :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#  sponsoring_org    :string(255)
#

class Project < ActiveRecord::Base
  validates_presence_of :name, :description, :location,
                        :children_allowed, :sponsoring_org
end
