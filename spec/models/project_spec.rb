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

require 'rails_helper'

describe Project do
  context 'associations' do
    it "returns a project's owner" do
      user = create(:user)
      project = build(:project, owner_id: user.id)

      expect(project.owner).to eq(user)
    end
  end

  context 'validations' do
    it 'is valid when required attributes are present' do
      expect(build(:project)).to be_valid
    end

    context 'is invalid when required attributes are missing' do
      it 'name' do
        expect(build(:project, name: nil)).to be_invalid
      end

      it 'description' do
        expect(build(:project, description: nil)).to be_invalid
      end

      it 'address_1' do
        expect(build(:project, address_1: nil)).to be_invalid
      end

      it 'city' do
        expect(build(:project, city: nil)).to be_invalid
      end

      it 'country' do
        expect(build(:project, country: nil)).to be_invalid
      end

      it 'children_allowed' do
        expect(build(:project, children_allowed: nil)).to be_invalid
      end

      it 'sponsoring_org' do
        expect(build(:project, sponsoring_org: nil)).to be_invalid
      end

      it 'begin_time' do
        expect(build(:project, begin_time: nil)).to be_invalid
      end

      it 'end_time' do
        expect(build(:project, end_time: nil)).to be_invalid
      end

      it 'end_time' do
        expect(build(:project, time_zone: nil)).to be_invalid
      end

      it 'is invalid when max_signups is negative' do
        expect(build(:project, max_signups: -2)).not_to be_valid
      end
    end
  end

  context 'location' do
    it 'comma-separates fields when all are present' do
      project = build(
        :project,
        address_1: '123 Main St.',
        address_2: 'Apt 15',
        city: 'NYC',
        region: 'NY',
        postal_code: '11101',
        country: 'US',
      )

      address = '123 Main St., Apt 15, NYC, NY, 11101, United States of America'
      expect(project.location).to eq(address)
    end
  end
end
