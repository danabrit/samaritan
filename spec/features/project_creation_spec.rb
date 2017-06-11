require 'rails_helper'

feature "Creating a new project" do
  scenario "User inputs all required fields" do
    sign_in create(:user)

    visit "/projects/new"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: "This is the neatest project ever."
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    fill_in "Date/Time Starts", with: "2015-07-08 13:31"
    fill_in "Date/Time Ends", with: "2015-07-08 17:31"
    fill_in "Location", with: "Sunny Side Park"
    fill_in "Max Signups", with: "3"

    click_button "Create Project"

    expect(page).to have_content("Cool Awesome Project")
    expect(page).to have_content("Description: This is the neatest project ever.")
    expect(page).to have_content("Sponsoring Organization: The Red Hat Ladies Club")
    expect(page).to have_content("Date/Time Starts: 2015-07-08 13:31")
    expect(page).to have_content("Date/Time Ends: 2015-07-08 17:31")
    expect(page).to have_content("Location: Sunny Side Park")
    expect(page).to have_content("Max Signups: 3")

    expect(page).to have_content("Project was successfully created.")
  end

  scenario "User omits a required field" do
    sign_in create(:user)

    visit "/projects/new"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    fill_in "Date/Time Starts", with: "2015-07-08 13:31"
    fill_in "Date/Time Ends", with: "2015-07-08 17:31"
    fill_in "Location", with: "Sunny Side Park"
    fill_in "Max Signups", with: "3"

    click_button "Create Project"

    expect(page).to have_content("There was a problem creating this project.")
    expect(page).to have_content("description can't be blank")
  end
end
