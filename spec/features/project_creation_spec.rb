require "spec_helper"

feature "Creating a new project" do
  scenario "User inputs all required fields" do
    visit "/projects/new"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: "This is the neatest project ever."
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    fill_in "Date/Time Starts", with: "2015-07-08 13:31"
    fill_in "Date/Time Ends", with: "2015-07-08 17:31"
    fill_in "Location", with: "Sunny Side Park"
    fill_in "Max Signups", with: "3"

    click_button "Create Project"

    expect(page).to have_content("Description: This is the neatest project ever.")
  end
end