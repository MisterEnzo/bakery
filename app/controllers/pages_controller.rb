class PagesController < ApplicationController
  def home
    @menu_items = MenuItem.all
  end
end
