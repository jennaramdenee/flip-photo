require "rails_helper"

feature "Flipboard" do
  context "no posts have been added" do
    scenario "should display an empty page" do
      visit "/posts"
      expect(page).not_to have_css("div#photo-front")
    end
  end
end
