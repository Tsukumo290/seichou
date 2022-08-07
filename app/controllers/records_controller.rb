class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :home
  before_action :records_find, only: [:index, :show]
  before_action :record_find, only: [:show, :edit, :update, :destroy]
  before_action :user_judge, only: [:edit, :destroy]

  #ホームページ
  def home
  end
  
  #タグ検索ページ
  def tag
    if params[:search].present?
      @records = Record.records_serach(params[:search])
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @records = @tag.records.order(created_at: :desc)
    else
      @records = Record.all.order(created_at: :desc)
    end
    @tag_lists = Tag.all
  end

  #月毎のページ遷移
  def eight
    @eight = Record.where('created_at like ?','%-08-%').where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end
  def nine
    @nine = Record.where('created_at like ?','%-09-%').where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end
  
  def index
    @tag_lists = Tag.all
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
    @tag_lists = Tag.all
  end

  def edit
    @tag_list =@record.tags.pluck(:name_tag).join(",")
  end

  def update
    tag_list = params[:record][:tag_ids].split(',')
    if @record.update(record_params)
      @record.save_tags(tag_list)
      redirect_to record_path(@record.id)
    else
      render :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path
  end

  private
  def record_params
    params.require(:record).permit(:title, :content, :image, :height, :weight).merge(user_id: current_user.id)
  end

  def records_find
    @records = Record.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end

  def record_find
    @record = Record.find(params[:id])
  end

  def user_judge
    redirect_to root_path unless current_user.id == @record.user.id
  end

end
