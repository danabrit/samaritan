require 'rails_helper'

feature "Creating a new project" do
  scenario "User inputs all required fields" do
    sign_in create(:user)

    visit "/projects/new"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: "This is the neatest project ever."
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    select_datetime("Date/Time Starts", Time.zone.now + 1.month)
    select_datetime("Date/Time Ends", Time.zone.now + 1.month + 4.hours)
    fill_in "Address 1", with: "Sunny Side Park"
    fill_in "City", with: "Evansville"
    fill_in "Region", with: "IN"
    fill_in "Country", with: "US"
    fill_in "Max Number of Signups Allowed", with: "3"

    click_button "Create Project"

    expect(page).to have_content("Cool Awesome Project")
    expect(page).to have_content("Description: This is the neatest project ever.")
    expect(page).to have_content("Location: Sunny Side Park, Evansville, IN, US")
    expect(page).to have_content("Max Signups: 3")

    expect(page).to have_content("Project was successfully created.")
  end

  scenario "User omits a required field" do
    sign_in create(:user)

    visit "/projects/new"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    select_datetime("Date/Time Starts", Time.zone.now + 1.month)
    select_datetime("Date/Time Ends", Time.zone.now + 1.month + 4.hours)
    fill_in "Address 1", with: "Sunny Side Park"
    fill_in "City", with: "Evansville"
    fill_in "Region", with: "IN"
    fill_in "Country", with: "US"
    fill_in "Max Number of Signups Allowed", with: "3"

    click_button "Create Project"

    expect(page).to have_content("There was a problem creating this project.")
    expect(page).to have_content("description can't be blank")
  end
end
