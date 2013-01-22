class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :carregar_projetos, :except => []

  def carregar_projetos
    $projetos ||= Projeto.all
  end
end
