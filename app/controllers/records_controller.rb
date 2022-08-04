class RecordsController < ApplicationController
  def home
  end

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create

  end
  
end
