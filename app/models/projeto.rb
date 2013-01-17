class Projeto < ActiveRecord::Base
  attr_accessible :nome, :valor_hora, :atividades

  has_many :atividades
  belongs_to :cliente
  validates_presence_of :cliente_id
end
