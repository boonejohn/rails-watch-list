class ListsController < ApplicationController

  def index
    @list = list.all
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

  def destroy
    @list.destroy
  end

  private

  def restaurant_params
    params.require(:list).permit :name
  end

end
