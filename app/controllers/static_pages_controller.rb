class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def contact
  end
end
