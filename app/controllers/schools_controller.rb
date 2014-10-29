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
    @school = School.new(:name => school_params[:name], :website => school_params[:website], :address => school_params[:address], :contact => school_params[:contact], :email => school_params[:email])
    @school.tag_list.add(school_params[:tag_list], parse: true)
    if @school.save
      flash[:success] = "New School Added!"
      redirect_to @school
    else
      render 'new'
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :website, :address, :contact, :email, :tag_list)
  end
end
