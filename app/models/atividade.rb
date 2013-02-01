class Atividade < ActiveRecord::Base
  attr_accessible :descricao, :projeto_id, :horas

  scope :do_usuario, lambda {|user_id| joins(:projeto).joins("join clientes on clientes.id=projetos.cliente_id").joins("join clientes_users on clientes_users.cliente_id=clientes.id").where("user_id = ?", user_id) }

  belongs_to :projeto
  has_many :horas
  validates_associated :horas
  validates_presence_of :projeto_id
end
