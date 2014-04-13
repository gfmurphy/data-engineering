class PurchaseFile < ActiveRecord::Base
  mount_uploader :data_file, DataFileUploader

  has_many :purchases, dependent: :destroy

  validates :filename, presence: true

  before_validation :set_file_data

  private
  def set_file_data
    if data_file_changed?
      self.filename = data_file.file.try(:filename)
    end
  end
end
