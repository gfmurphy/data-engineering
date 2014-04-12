class PurchaseFilesController < ApplicationController
  respond_to :html

  def index
    @purchase_files = PurchaseFile.order(created_at: :desc)
  end
end
