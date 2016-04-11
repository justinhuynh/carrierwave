require "rails_helper"

feature "user signs up" do
  scenario "signs up successfully" do
    visit new_user_registration_path

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "Password2"
    fill_in "Password confirmation", with: "Password2"

    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/example_photo.png"
    click_on "Sign up"

    user = User.last
    expect(page).to have_content("test@test.com")
    expect(page).to have_xpath("//img[@src=\"/uploads/user/profile_photo/#{user.id}/example_photo.png\"]")
    expect(user.profile_photo.file.filename).to eq("example_photo.png")
  end
end
