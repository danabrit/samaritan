# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  begin_time        :datetime         not null
#  end_time          :datetime         not null
#  address_1         :string
#  supplies_required :text
#  children_allowed  :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#  sponsoring_org    :string
#  max_signups       :integer
#  owner_id          :integer          not null
#  address_2         :string
#  city              :string
#  region            :string
#  postal_code       :string
#  country           :string
#  time_zone         :string           not null
#

FactoryBot.define do
  factory :project do
    name 'Park Cleanup'
    description "The park needs some love. Let's clean it up!"
    begin_time '2014-03-20 17:40:08'
    end_time '2014-03-20 17:40:08'
    address_1 'Pine Wood Park'
    city 'Phoenix'
    country 'US'
    time_zone 'Central Time (US & Canada)'
    supplies_required 'Gloves and trash bags'
    children_allowed true
    sponsoring_org 'The Clean Parks Committee'
    max_signups 20
    owner
  end

  factory :invalid_project, class: Project do
    name nil
  end
end
