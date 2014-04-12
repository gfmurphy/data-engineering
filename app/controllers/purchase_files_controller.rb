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
    @purchase_file = PurchaseFile.new(purchase_file_params)
    flash[:notice] = "File uploaded successfully." if @purchase_file.save
    respond_with(@purchase_file, location: purchase_files_url)
  end

  private
  def purchase_file_params
    params.permit(purchase_file: :data_file).fetch(:purchase_file, {})
  end
end
