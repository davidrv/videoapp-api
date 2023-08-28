# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[show destroy]

  # GET /items or /items.json
  def index
    @items = @list.items.all
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = @list.items.new
  end

  # POST /items or /items.json
  def create
    @item = Items::Build.new(list: @list, url: item_params[:url]).call

    if @item.save
      redirect_to list_items_url(@list), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  rescue VideoInfo::UrlError
    redirect_to new_list_item_url(@list), alert: 'Cannot extract video info from this URL'
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    redirect_to list_items_url(@list), notice: 'Item was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = @list.items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:list_id, :url)
  end

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end
end
