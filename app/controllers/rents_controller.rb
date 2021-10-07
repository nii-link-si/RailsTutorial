class RentsController < ApplicationController
  def index
    @rents = Rent.all
  end
end
