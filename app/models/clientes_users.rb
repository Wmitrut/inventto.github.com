class ClientesUsers < ActiveRecord::Base
  attr_accessible :cliente_id, :user_id

  belongs_to :cliente
  belongs_to :user
end
