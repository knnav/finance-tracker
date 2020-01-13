class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You just made an empty query.'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "That symbol does not match any record" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end 
end