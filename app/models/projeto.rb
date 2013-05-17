class Projeto < ActiveRecord::Base
  set_table_name "projects"
  attr_accessible :nome,:descricao #, :valor_hora, :atividades

#  has_many :atividades
#  belongs_to :cliente
#  validates_presence_of :cliente_id

  def label
    nome
  end

  def create_authorized?
    self.user_is_developer?
  end

  def nome 
    name
  end

  def descricao
    description
  end
end
