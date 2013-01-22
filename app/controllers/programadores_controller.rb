class ProgramadoresController < ApplicationController
  active_scaffold :programador do |conf|
    conf.columns = [:nome, :descricao]
    conf.list.columns.exclude :descricao
  end
end
