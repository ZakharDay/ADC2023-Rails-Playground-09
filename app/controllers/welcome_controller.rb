class WelcomeController < ApplicationController
  # layout 'custom'

  def index
    @subscription = Subscription.new
    @color = '#'
    options = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
    6.times { @color += options.sample }

    # Meta
    @title = "Название сервиса"
    # end
  end

  def about
  end

  def feed
    @posts = Post.all
  end
end
