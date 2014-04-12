class PurchaseFilesController < ApplicationController
  respond_to :html

  def index
    @purchase_files = PurchaseFile.order(created_at: :desc)
    respond_with(@purchase_files)
  end

  def new
    @purchase_file = PurchaseFile.new
    respond_with(@purchase_file)
  end

  def create
    @purchase_file = PurchaseFile.create(purchase_file_params)
    respond_with(@purchase_file)
  end

  private
  def purchase_file_params
    params.permit(purchase_file: :data_file).fetch(:purchase_file, {})
  end
end
