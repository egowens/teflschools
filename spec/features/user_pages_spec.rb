require 'rails_helper'

describe "Devise pages" do

  subject{ page }

  describe "sign in page" do
    before{visit new_user_registration_path}

    it{ should have_title("TEFL Schools | Signup!") }
    it{ should have_content("Sign up Now!") }
  end
end
