class StudiosController < ApplicationController
  def new

  end

  def index
    @studios = Studio.all
  end

  def show

  end
end
