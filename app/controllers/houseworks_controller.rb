class HouseworksController < ApplicationController
  def new
    @housework = Housework.new
  end
end
