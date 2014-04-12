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

  context "when valid file is attached" do
    given(:filename) { "example_input.tab" }
    given(:filepath) { File.join(Rails.root, "spec", "fixtures", filename) }

    specify "successful file upload" do
      visit new_purchase_file_path
      upload_file
      must_see_success_message
      must_see_filename
      must_see_gross_revenue
    end
  end

  def upload_file
    within("#new_purchase_file") do
      attach_file "Purchase file", filepath
      click_button "Upload file"
    end
  end

  def must_see_success_message
    within("#flash_notice") do
      expect(page).to have_content "File uploaded successfully."
    end
  end

  def must_see_filename
    within("#purchase_files") do
      expect(page).to have_content filename
    end
  end

  def must_see_gross_revenue
    within("#purchase_files") do
      expect(page).to have_content("$95.00")
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
