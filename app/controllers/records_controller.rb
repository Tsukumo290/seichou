class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :home

  #ホームページ
  def home
  end

  #アルバムページ
  def album
    
  end

  #月毎のページ遷移
  def eight
    @eight = Record.where('created_at like ?','%-08-%').order(created_at: :desc)
  end
  def nine
    @nine = Record.where('created_at like ?','%-09-%').order(created_at: :desc)
  end
  
  def index
    @records = Record.order(created_at: :desc)
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    tag_list = params[:record][:tag_ids].split(',')
    if @record.save
      @record.save_tags(tag_list)
      redirect_to record_path(@record.id)
    else
      render :new
    end
  end

  def show
    @records = Record.order(created_at: :desc)
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
    @tag_list =@record.tags.pluck(:name_tag).join(",")
  end

  def update
    @record = Record.find(params[:id])
    tag_list = params[:record][:tag_ids].split(',')
    if @record.update(record_params)
      @record.save_tags(tag_list)
      redirect_to record_path(@record.id)
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private
  def record_params
    params.require(:record).permit(:title, :content, :image, :height, :weight).merge(user_id: current_user.id)
  end

end
