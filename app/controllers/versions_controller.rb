class VersionsController < ApplicationController
  before_action :set_list

  def index
    @versions = @list.versions
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end
end
