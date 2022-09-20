# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.order :name
    authorize! :index, Category

    render :index
  end

  def add_doctor
    @category = find_category
    authorize! :join_to, @category

    @category.doctors << current_user
    flash[:notice] = "User was added to #{@category.name} category."
    redirect_to action: :index
  end

  def delete_doctor
    @category = find_category
    authorize! :leave, @category

    @category.doctors.delete current_user
    flash[:notice] = "User was deleted from #{@category.name} category."
    redirect_to action: :index
  end

  private

  def find_category
    Category.find params[:name]
  end
end
