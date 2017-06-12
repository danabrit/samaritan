require 'rails_helper'

feature "Viewing the list of existing projects" do
  scenario "Some projects already exist" do
    project = create(:project, name: "ABC Project")
    project2 = create(:project, name: "XYZ Project")

    visit projects_path

    expect(page).to have_content("Projects")

    within("table#projects") do
      within("tr#project_#{ project.id}") do
        expect(page).to have_content("ABC Project")
        expect(page).to have_css("img[title='Edit ABC Project']")
      end
      within("#project_#{ project2.id }") do
        expect(page).to have_content("XYZ Project")
        expect(page).to have_css("img[title='Edit XYZ Project']")
      end
    end
  end

  scenario "There are no existing projects" do
    sign_in(create(:user))

    visit "/projects"

    expect(page).to have_content("Projects")

    expect(page).not_to have_content("table#projects")
    expect(page).to have_content("New Project")
    expect(page).to have_content("There are currently no active projects.")
  end
end
