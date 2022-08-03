class RecordsController < ApplicationController
  def home
  end

  def index
    @record = Record.all
  end

  def new
  end

  def create
  end
end
