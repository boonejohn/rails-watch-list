class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update]
  def index
    @list = List.all
  end

  def show; end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = list.find(params[:id])
  end

  def list_params
    params.require(:list).permit :name
  end
end
