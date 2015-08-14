require 'spec_helper'

describe ProjectsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to be(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns to projects" do
      project1, project2 = create(:project), create(:project)
      get :index
      expect(assigns(:projects)).to match_array([ project1, project2 ])
    end
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response.status).to be(200)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end

    it "assigns to project" do
      expect(assigns(:project)).to be_kind_of(Project)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new project" do
        expect{ post :create, project: attributes_for(:project) }.to change(Project, :count).by(1)
      end

      it "redirects to the project" do 
        post :create, project: attributes_for(:project)
        expect(response).to redirect_to project_path(assigns[ :project ])
      end

      it "assigns the flash" do
        post :create, project: attributes_for(:project)
        expect(flash[:success]).to eq("Project was successfully created.")
      end
    end

    context "with invalid attributes" do
      it "does not save the new project" do
        expect{ post :create, project: attributes_for(:invalid_project) }.to_not change(Project, :count)
      end

      it "re-renders the new method" do
        post :create, project: attributes_for(:invalid_project)
        expect(response).to render_template(:new)
      end

      it "assigns the flash" do
        post :create, project: attributes_for(:invalid_project)
        expect(flash[:error]).to eq("There was a problem creating this project.")
      end
    end
  end

  describe "GET #edit" do
    before do
      @project = create(:project)
      get :edit, id: @project.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response.status).to be(200)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end

    it "assigns to project" do
      expect(assigns(:project)).to be == @project
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      before do
        @project = create(:project)
        put :update, id: @project, project: attributes_for(:project)
      end

      it "redirects to the project" do 
        expect(response).to redirect_to(project_path(assigns[ :project ]))
      end

      it "assigns the flash" do
        expect(flash[:success]).to eq("Project was successfully updated.")
      end
    end

    context "with invalid attributes" do
      before do
        @project = create(:project)
        put :update, id: @project, project: attributes_for(:invalid_project)
      end

      it "re-renders the edit method" do
        expect(response).to render_template(:edit)
      end

      it "assigns the flash" do
        expect(flash[:error]).to eq("There was a problem updating this project.")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @project = create(:project, name: "Shortlived")
    end

    it "deletes the project" do
      expect{ delete :destroy, id: @project }.to change(Project,:count).by(-1)
    end

    it "redirects to the projects list" do
      delete :destroy, id: @project
      expect(response).to redirect_to(projects_path)
    end

    it "assigns the flash" do
      delete :destroy, id: @project
      expect(flash[:success]).to eq("Deleted the project: Shortlived.")
    end
  end
end