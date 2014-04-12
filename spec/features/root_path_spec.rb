require "spec_helper"

feature "Home page" do
  specify "viewing purchase files" do
    visit root_path
    must_see_heading
    must_see_add_purchase_file_link
    must_see_no_purchase_file_message
  end

  def must_see_no_purchase_file_message
    within "#purchase_files" do
      expect(page).to have_content "No purchase files have been uploaded"
    end
  end

  def must_see_add_purchase_file_link
    within ".actions" do
      expect(page).to have_link "Add Purchase file", new_purchase_file_path
    end
  end

  def must_see_heading
    within("h1") do
      expect(page).to have_content "Purchase Files"
    end
  end
end
