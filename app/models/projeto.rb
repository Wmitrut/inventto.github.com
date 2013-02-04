class Projeto < ActiveRecord::Base
  attr_accessible :nome,:descricao, :valor_hora, :atividades

  has_many :atividades
  belongs_to :cliente
  validates_presence_of :cliente_id

  def label
    nome
  end

  def create_authorized?
    self.user_is_developer?
  end
end
