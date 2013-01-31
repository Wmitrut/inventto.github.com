class Projeto < ActiveRecord::Base
  attr_accessible :nome,:descricao, :valor_hora, :atividades

  scope :do_usuario, lambda { |user_id| joins(:cliente).joins("join clientes_users on clientes_users.cliente_id = clientes.id").where("user_id = ?", user_id) }

  has_many :atividades
  belongs_to :cliente
  validates_presence_of :cliente_id
  def label
    nome
  end
end
