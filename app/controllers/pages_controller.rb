class PagesController < ApplicationController
  def home
    @airport = Airport.first
  end
end
