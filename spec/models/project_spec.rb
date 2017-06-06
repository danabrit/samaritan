# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  begin_time        :datetime
#  end_time          :datetime
#  location          :string
#  supplies_required :text
#  children_allowed  :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#  sponsoring_org    :string
#  max_signups       :integer
#  owner_id          :integer          not null
#

require 'spec_helper'

describe Project do
  context "associations" do
    it "returns a project's owner" do
      user = create(:user)
      project = build(:project, owner_id: user.id)

      expect(project.owner).to eq(user)
    end
  end

  context "validations" do
    it "should validate presence of name" do
      bad_project = FactoryGirl.build(:project, name: nil)
      expect(bad_project).to be_invalid
    end

    it "should validate presence of description" do
      bad_project = FactoryGirl.build(:project, description: nil)
      expect(bad_project).to be_invalid
    end

    it "should validate presence of location" do
      bad_project = FactoryGirl.build(:project, location: nil)
      expect(bad_project).to be_invalid
    end

    it "should validate presence of children_allowed" do
      bad_project = FactoryGirl.build(:project, children_allowed: nil)
      expect(bad_project).to be_invalid
    end

    it "should validate presence of sponsoring_org" do
      bad_project = FactoryGirl.build(:project, sponsoring_org: nil)
      expect(bad_project).to be_invalid
    end

    it "should validate presence of begin_time" do
      bad_project = FactoryGirl.build(:project, begin_time: nil)
      expect(bad_project).to be_invalid
    end

    it "should validate presence of end_time" do
      bad_project = FactoryGirl.build(:project, end_time: nil)
      expect(bad_project).to be_invalid
    end

    context "#max_signups" do
      it "should be valid when max_signups is present" do
        project = FactoryGirl.build(:project, max_signups: 8)
        expect(project).to be_valid
      end

      it "should be valid when max_signups is not present" do
        project = FactoryGirl.build(:project, max_signups: nil)
        expect(project).to be_valid
      end

      it "should be valid when max_signups is not present" do
        project = FactoryGirl.build(:project, max_signups: "")
        expect(project).to be_valid
      end

      it "should be invalid when max_signups is negative" do
        project = FactoryGirl.build(:project, max_signups: -2)
        expect(project).not_to be_valid
      end
    end
  end
end
