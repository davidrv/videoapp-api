class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = @list.items.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = @list.items.new
  end

  # POST /items or /items.json
  def create
    operation = Items::Create.call(list: @list, url: item_params[:url])
    @item     = operation[:model]

    respond_to do |format|
      if operation[:success?]
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_items_url(@list), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @list.items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.permit(:list_id, :url)
    end

    def set_list
      @list = current_user.lists.find(params[:list_id])
    end
end
