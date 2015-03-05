class Admin::ImportsController < ApplicationController
  before_action :set_import, only: [:show, :edit, :update]

  def index
    @imports = Import.all
  end

  def show
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new import_params
    if @import.save
      flash[:success] = "Successfully imported products."
      redirect_to admin_imports_path
    else
      flash.now[:danger] = "Error while importing due to incomplete data."
      render "new"
    end
  end

  def edit
  end

  def update
    if @import.update_attributes import_params
      flash[:success] = "Successfully updated import."
      redirect_to admin_imports_path
    else
      flash.now[:danger] = "Error while importing due to incomplete data."
      render "edit"
    end
  end

  private

    def set_import
      @import = Import.find params[:id]
    end

    def import_params
      params.require(:import).permit(:description,
        import_products_attributes: [:import_id, :product_id, :product_unit, :price])
    end
end
