class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @name=@user.name
    @blogs=@user.blogs.page(params[:page]).order('created_at DESC').per(3)
  end
end
