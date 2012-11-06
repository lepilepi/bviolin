include CartHelper

class CartController < ApplicationController
  def update
    @item = Item.find(params[:id])

    if not session.has_key?(:items)
      session[:items] = {}
    end


    begin
      amount=Integer(params[:amount])
    rescue ArgumentError => e
      flash[:error] = "#{params[:amount]} is not a number"
      return redirect_to action: "show", controller: "items"
    end

    if session[:items].has_key?(@item)
        session[:items][@item]+=amount
    else
      session[:items][@item]=amount
    end

    update_total

    respond_to do |format|
      format.html { redirect_to action: "index" }
      format.json { render json: @item, status: :created, location: @item }
    end

  end

  def remove
    if params.has_key?(:id)
      item = Item.find(params[:id])
      if session.has_key?(:items) and session[:items].has_key?(item)
        session[:items].delete(item)
      end
    else
      if session.has_key?(:items)
        session.delete(:items)
      end
    end

    update_total
    redirect_to action: "index" 
  end

  def index
    @item_hash = session[:items]
    if session.has_key?(:total)
      @total = session[:total]
    end
  end

  def checkout
    if session.has_key?(:total) and session.has_key?(:items) and session[:items].length>0
      @total = session[:total]
    else
      render :nothing => true, :status => 403
    end
  end

  def order
    field_names = [:name, :email, :address, :phone, :notes]

    field_names.each do |key|
      if not (params[:order].has_key?(key) and params[:order][key].length>0)
        flash[:error] = "Please fill out all the fields! (#{key} was empty)"
        return redirect_to action: "checkout"
      end
    end

    UserMailer.send_order(session, params[:order]).deliver

    if session.has_key?(:items)
      session.delete(:items)
    end
    flash[:notice] = "Thank you for your order!"
    redirect_to action: "index"

  end

end
