# frozen_string_literal: true
module Api
  module V1
    class VideosController < ApplicationController
      before_action :set_list

      def index
        @items = @list.items.all

        render json: @items
      end

      def show
        @item = @list.items.find(params[:id])

        render json: @item
      end

      private

      def set_list
        @list = List.find(params[:list_id])
      end
    end
  end
end
