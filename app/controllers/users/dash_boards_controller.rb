class Users::DashBoardsController < ApplicationController
  before_action :authenticate_user! # Deviseを使用している場合

    def index
      @user = current_user
    end
end
