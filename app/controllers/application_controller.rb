class ApplicationController < ActionController::Base
  protect_from_forgery

begin  before_filter :carregar_projetos, :only => :index

  def carregar_projetos
    $projetos ||= Projeto.all
  end
end
end

