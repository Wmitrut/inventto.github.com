class ProjetosController < ApplicationController
  before_filter :usuario_requerido

  active_scaffold :projeto do |conf|
    conf.columns = [:nome,:descricao,:valor_hora,:cliente]
    conf.columns.exclude :atividades
    conf.list.columns.exclude :descricao
  end
  def beginning_of_chain
    user.projetos
  end
end
