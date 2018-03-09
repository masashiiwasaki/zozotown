class OrdersController < ApplicationController
  def new
    
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: params[:amount], card: params['payjp-token'])
  end
end
