class Api::PurchasesController < ApplicationController

  def show
    @purchase = Purchase.find(params[:id])
    if @purchase
      render :show
    else
      render_errors @purchase.errors.to_a
    end
  end

  def create
    options = create_params
    @purchase = Purchase.new(options)
    if @purchase.save
      render :show, status: :ok
    else
      render_errors @purchase.errors.to_a
    end
  end

  private
  def create_params
    params.require(:purchase).permit(
      :user_id, :currency, :amount, :ordered_from, items: [:product_name, :qty, :amount]
    )
  end
end
