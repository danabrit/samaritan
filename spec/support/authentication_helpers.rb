module AuthenticationHelpers
  @@data = {}

  def sign_in_as(user, password = "password")
    case RSpec.current_example.metadata[:type]
    when :request
      post user_session_path, user: {email: user.email, password: password}
    when :feature
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: password
      click_button "Log in"

    when :controller
      sign_in(user, scope: :user)
      allow(controller).to receive(:current_user) { user }
    end

    @@data[:user] = user
  end

  def sign_out
    click_link "Log out"
  end

  def sign_in_user
    user = create(:user)
    sign_in_as(user)
  end

  def sign_in_admin
    admin = create(:user, :admin)
    sign_in_as(admin)
  end
end

RSpec.configure do |config|
  config.include(Devise::Test::ControllerHelpers, type: :controller)
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :feature
  config.include AuthenticationHelpers, type: :request
  config.include AuthenticationHelpers, type: :controller
end
