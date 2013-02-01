class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :carregar_projetos, :only => :index
  def carregar_projetos
    $projetos ||= Projeto.all
  end
  def user
    @user ||= User.find(session[:user_id])
  end
  def cliente
    user.cliente if user
  end
  
end
