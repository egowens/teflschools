require 'rails_helper'

describe "Schools pages" do

  subject{ page }

  describe "index" do
    before do
      FactoryGirl.create(:school, name: "A-B-C TEFL")
      FactoryGirl.create(:school, name: "X-Y-Z TEFL")
      visit schools_path
    end

    it{ should have_title("TEFL Schools | Schools") }
    it{ should have_content("All Schools") }

    it "should list all schools" do
      School.all.each do |school|
        expect(page).to have_selector('li', text: school.name)
      end
    end
  end

  describe "school profile page" do
    let(:school){ FactoryGirl.create(:school) }
    before{ visit school_path(school) }

    it{ should have_content(school.name) }
    it{ should have_content(school.address) }
    it{ should have_content(school.contact) }
    it{ should have_content(school.email) }
  end

  describe "new school page" do
    before{ visit new_school_path }

    it{ should have_content("Add a new school") }
    it{ should have_title("TEFL Schools | New School") }
  end
end