class Cliente < ActiveRecord::Base
  attr_accessible :nome, :users

  scope :do_usuario, lambda {|user_id| joins("join clientes_users on clientes_users.cliente_id = clientes.id").where("user_id = ?", user_id)}

  has_and_belongs_to_many :users

  def label
   nome
  end
end
