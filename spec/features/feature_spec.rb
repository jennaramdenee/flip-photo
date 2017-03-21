require "rails_helper"

feature "Flipboard" do

  context "no posts have been added" do
    scenario "should display an empty page" do
      visit "/posts"
      expect(page).to have_css("div#photos")
      expect(page).not_to have_css("div#photo-front")
    end
  end

  context "add a new post" do
    scenario "page should have a form to create a new post" do
      visit "/posts/new"
      expect(page).to have_css("form")
    end

    scenario "displays the description once form has been completed" do
      visit "/posts/new"
      fill_in 'Date', with: '03/03/2017'
      fill_in 'Description', with: "test"
      click_button "Add Photo"
      expect(page).to have_content("test")
    end

    scenario "displays the date once form has been completed" do
      visit "/posts/new"
      fill_in 'Date', with: '03/03/2017'
      fill_in 'Description', with: "test"
      click_button "Add Photo"
      expect(page).to have_content("03/03/2017")
    end

    scenario "displays images once form has been completed" do
      visit "/posts/new"
      fill_in 'Date', with: "06/06/2017"
      fill_in 'Description', with: "Penguin"
      # file = Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/penguin.jpeg"), 'image/png')
      attach_file("Image", 'spec/fixtures/files/penguin.jpeg')
      click_button "Add Photo"
      expect(page).to have_css("img", :src => "penguin.jpeg")
    end
  end

end
