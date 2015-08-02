require "spec_helper"

feature "Editing an existing project" do
  scenario "User inputs all required fields" do
    project = create(:project)

    visit "/projects/#{ project.id }/edit"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: "This is the best thing you will ever do."
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    fill_in "Date/Time Starts", with: "2015-07-08 13:31"
    fill_in "Date/Time Ends", with: "2015-07-08 17:31"
    fill_in "Location", with: "Sunny Side Park"
    fill_in "Max Signups", with: "3"

    click_button "Update Project"

    expect(page).to have_content("Cool Awesome Project")
    expect(page).to have_content("Description: This is the best thing you will ever do.")
    expect(page).to have_content("Sponsoring Organization: The Red Hat Ladies Club")
    expect(page).to have_content("Date/Time Starts: 2015-07-08 13:31")
    expect(page).to have_content("Date/Time Ends: 2015-07-08 17:31")
    expect(page).to have_content("Location: Sunny Side Park")
    expect(page).to have_content("Max Signups: 3")

    expect(page).to have_content("Project was successfully updated.")
  end

  scenario "User omits a required field" do
    project = create(:project)

    visit "/projects/#{ project.id }/edit"

    fill_in "Name", with: "Cool Awesome Project"
    fill_in "Description", with: ""
    fill_in "Sponsoring Organization", with: "The Red Hat Ladies Club"
    fill_in "Date/Time Starts", with: "2015-07-08 13:31"
    fill_in "Date/Time Ends", with: "2015-07-08 17:31"
    fill_in "Location", with: "Sunny Side Park"
    fill_in "Max Signups", with: "3"

    click_button "Update Project"

    expect(page).to have_content("There was a problem updating this project.")
  end
end