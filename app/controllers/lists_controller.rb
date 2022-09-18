class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    flash[:notice] = "投稿が成功しました!!"
    redirect_to list_path(@list.id)
    else
    render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    flash[:notice] = "編集しました!!"
    redirect_to list_path(list.id)  
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:notice] = "削除しました。"
    redirect_to "/lists"
  end
  
  private
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
