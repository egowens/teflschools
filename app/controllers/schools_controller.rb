class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = "New School Added!"
      redirect_to @school
    else
      render 'new'
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :contact, :email)
  end
end
