class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  def home
    if logged_in?
      @entry  = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @user = User.all
      @users = @user.entries
      @entries = Entry.all.paginate(page: params[:page])
    end
  end

  def help
  end

  def login
  end
end

