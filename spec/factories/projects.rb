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
#  max_signups       :integer
#

FactoryGirl.define do
  factory :project do
    name              "Park Cleanup"
    description       "The park needs some love. Let's clean it up!"
    begin_time        "2014-03-20 17:40:08"
    end_time          "2014-03-20 17:40:08"
    location          "Pine Wood Park"
    supplies_required "Gloves and trash bags"
    children_allowed  true
    sponsoring_org    "The Clean Parks Committee"
    max_signups       20
  end

  factory :invalid_project, class: Project do
    name              nil
  end
end
