class StaticPagesController < ApplicationController
  def home
    num = 5
    @articles = Article.order(updated_at: :desc).limit(num)
  end

  def contact
  end
end
