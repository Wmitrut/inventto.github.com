class ProjetosController < ApplicationController
  active_scaffold :projeto do |conf|
    conf.columns = [:nome,:descricao,:valor_hora,:cliente]
    conf.columns.exclude :atividades
    conf.list.columns.exclude :descricao
  end
end
