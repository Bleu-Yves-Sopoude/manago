class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ability

  def set_ability
    @ability = Ability.new(current_user)
  end

  def index
    if current_user
      # Retrieve the user along with their associated categories and purchases.
      @user = User.includes(categories: :purchases).find(current_user.id)
      @totals = []
      @user.categories.each do |cat|
        total_amt = 0
        cat.purchases.each do |p|
          total_amt += p.amount
        end
        @totals << total_amt
      end
    else
      redirect_to new_user_session_path, notice: 'Please sign in to view your categories.'
    end
  end

  def show
    @category = Category.includes(:purchases).find(params[:id])
    @total = 0

    @category.purchases.each do |p|
      @total += p.amount
    end
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path, notice: 'Category added'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name, :icon)
  end
end
