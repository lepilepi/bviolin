class CartController < ApplicationController
  def update
    @item = Item.find(params[:id])

    if not session.has_key?(:items)
      session[:items] = {}
    end


    begin
      amount=Integer(params[:amount])
    rescue ArgumentError => e
      flash[:error] = "sdasdas"
      return redirect_to action: "show", controller: "items"
    end

    if session[:items].has_key?(@item)
        session[:items][@item]+=amount
    else
      session[:items][@item]=amount
    end

    respond_to do |format|
      format.html { redirect_to action: "index" }
      format.json { render json: @item, status: :created, location: @item }
    end

  end

  def remove
  end

  def index
    @item_hash = session[:items]
  end

  def clear
  end

  def checkout
  end
end
