# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  begin_time        :datetime         not null
#  end_time          :datetime         not null
#  location          :string
#  supplies_required :text
#  children_allowed  :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#  sponsoring_org    :string
#  max_signups       :integer
#  owner_id          :integer          not null
#

class Project < ActiveRecord::Base
  belongs_to :owner, class_name: "User"

  validates :name, :description, :location, :sponsoring_org, :begin_time, :end_time, presence: true
  validates_inclusion_of :children_allowed, in: [ true, false ]
  validates :max_signups, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
