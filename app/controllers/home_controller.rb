class HomeController < ApplicationController
  def index
    @Author = "Koji Hijikuro"
    @Google = '<a href="http://www.google.com">Google</a>'
  end
end
