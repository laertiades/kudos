class StaticPagesController < ApplicationController
  def index
    @organizations = Organization.all
  end
end
