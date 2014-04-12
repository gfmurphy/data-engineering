require "spec_helper"

feature "Uploading a purchase file" do
  context "when no file attached" do
    specify "show error message" do
      visit new_purchase_file_path
      must_see_heading
      click_button "Upload file"
      must_see_error_message
    end
  end

  def must_see_heading
    within("h1") do
      expect(page).to have_content("Upload New Purchase File")
    end
  end

  def must_see_error_message
    within("#new_purchase_file") do
      expect(page).to have_content "Filename can't be blank"
    end
  end
end
