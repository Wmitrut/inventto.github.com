class Projeto < ActiveRecord::Base
  attr_accessible :nome, :valor_hora, :atividades

  has_many :atividades
end
