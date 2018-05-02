class PagesController < ApplicationController
  def home
    @menu_items = MenuItem.all
  end

  def about
  end

  def contact
  end

end
