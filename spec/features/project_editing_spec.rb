require 'rails_helper'

feature "Editing an existing project" do
  before do
    sign_in create(:user)
  end

  scenario "User inputs all required fields" do
    project = create(:project)

    visit "/projects/#{ project.id }/edit"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: "This is the best thing you will ever do."
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    select_datetime("Date/Time Starts", Time.zone.now + 1.month)
    select_datetime("Date/Time Ends", Time.zone.now + 1.month + 4.hours)
    fill_in "Address 1", with: "Sunny Side Park"
    fill_in "City", with: "Evansville"
    fill_in "Region", with: "IN"
    fill_in "Country", with: "US"
    fill_in "Max Number of Signups Allowed", with: "3"

    click_button "Update Project"

    expect(page).to have_content("Cool Awesome Project")
    expect(page).to have_content("Description: This is the best thing you will ever do.")
    expect(page).to have_content("Sponsoring Organization: The Red Hat Ladies Club")
    expect(page).to have_content("Location: Sunny Side Park, Evansville, IN, US")
    expect(page).to have_content("Max Signups: 3")

    expect(page).to have_content("Project was successfully updated.")
  end

  scenario "User omits a required field" do
    project = create(:project)

    visit "/projects/#{ project.id }/edit"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: ""
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    select_datetime("Date/Time Starts", with: Time.zone.now + 1.month)
    select_datetime("Date/Time Ends", with: Time.zone.now + 1.month + 4.hours)
    fill_in "Address 1", with: "Sunny Side Park"
    fill_in "City", with: "Evansville"
    fill_in "Region", with: "IN"
    fill_in "Country", with: "US"
    fill_in "Max Number of Signups Allowed", with: "3"

    click_button "Update Project"

    expect(page).to have_content("There was a problem updating this project.")
  end
end
