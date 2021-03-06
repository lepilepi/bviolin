include ApplicationHelper

class ItemsController < ApplicationController
  
  def index
  	if not session[:logged_in]
  		@items = Item.where(:published => true).search(params[:search], params[:sort])
  	else
  		@items = Item.search(params[:search], params[:sort])
  	end
  end

  def show
  	@item = Item.find(params[:id])
  	if not @item.published 
  		admin_only
  	end
  end

  def new
  	admin_only
  	@item = Item.new
  end

  def edit
  	admin_only
  	@item = Item.find(params[:id])
  	@item_photo = ItemPhoto.new
  end

  def create
  	admin_only
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	admin_only
    @item = Item.find(params[:id])
    @item_photo = ItemPhoto.new

    respond_to do |format|
      if params.has_key?(:item_photo)
      	  @item_photo = ItemPhoto.new(params[:item_photo])
      	  @item_photo.item = @item
          if @item_photo.save
          	flash[:notice] = 'Photo was successfully uploaded.'
	        format.html { redirect_to :action => 'edit' }
	        format.json { render json: @item_photo, status: :created, location: @item_photo }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @item_photo.errors, status: :unprocessable_entity }
	      end
      else
      	  if @item.update_attributes(params[:item])
	        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @item.errors, status: :unprocessable_entity }
	      end
      end      
    end

  end

  def destroy
  	admin_only
  	if params.has_key?(:item_photo_id)
  		ItemPhoto.find(params[:item_photo_id]).destroy
  		redirect_to :action => 'edit'
  	else
  		Item.find(params[:id]).destroy
  		redirect_to :action => 'index'
  	end
  end

  def make_default
  	admin_only
  	item = Item.find(params[:id])
  	item_photo = ItemPhoto.find(params[:item_photo_id])

  	if item.item_photos.include?(item_photo)
  		item.item_photo = item_photo
  		item.save
  	end

  	redirect_to :action => 'edit'
  end

end
