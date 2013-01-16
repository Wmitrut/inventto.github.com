class ProjetosController < ApplicationController
  active_scaffold :projeto do |conf|
    conf.columns.exclude :atividades
  end
end 
