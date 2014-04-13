require "spec_helper"

feature "Home page" do
  specify "viewing empty purchase file list" do
    visit root_path
    must_see_heading
    must_see_add_purchase_file_link
    must_see_no_purchase_file_message
  end

  context "when files have been uploaded" do
    given!(:newest_file) { FactoryGirl.create(:purchase_file) }
    given!(:oldest_file) { FactoryGirl.create(:purchase_file, created_at: 1.day.ago) }

    specify "viewing list of uploaded purchase files" do
      visit root_path
      must_see_ordered_list_of_purchase_files
      must_see_filenames
      must_see_date_uploaded
    end
  end

  def must_see_ordered_list_of_purchase_files
    within("ol#purchase_files") do
      expect(page).to have_selector("li:first#purchase_file_#{newest_file.id}")
    end
  end

  def must_see_filenames
    within("#purchase_files") do
      expect(page).to have_content(newest_file.filename)
      expect(page).to have_content(oldest_file.filename)
    end
  end

  def must_see_date_uploaded
    within("#purchase_files") do
      expect(page).to have_content(newest_file.created_at.to_s(:long))
      expect(page).to have_content(oldest_file.created_at.to_s(:long))
    end
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
