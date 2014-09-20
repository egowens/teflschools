require 'rails_helper'

describe "Static Pages" do
  describe "GET root" do
    it "should have text 'TEFL School Directory'" do
      visit '/'
      expect(page).to have_content("TEFL School Directory")
    end
  end

  describe "Visit about page" do
    it "should have text 'About'" do
      visit '/about'
      expect(page).to have_content("About")
    end
  end

  describe "Visit help page" do
    it "should have text 'Help'" do
      visit '/help'
      expect(page).to have_content("Help")
    end
  end
end
