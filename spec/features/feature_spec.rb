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

    scenario "displays the new post once form has been completed" do
      visit "/posts/new"
      fill_in 'Date', with: '03/03/2017'
      fill_in 'Description', with: "test"
      click_button "Add Photo"
      expect(page).to have_content("test")
    end
  end

end
