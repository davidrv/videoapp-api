# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[show destroy]

  # GET /lists or /lists.json
  def index
    @lists = current_user.lists.all
  end

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  # POST /lists or /lists.json
  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /lists/1/edit
  def edit
    @list = current_user.lists.find(params[:id])
  end

  # PATCH /lists/1
  def update
    @list = current_user.lists.find(params[:id])

    if @list.update(list_params)
      redirect_to list_items_url(@list), notice: 'List was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy
    redirect_to root_url, notice: 'List was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = current_user.lists.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
