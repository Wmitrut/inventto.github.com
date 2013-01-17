class Clientes < ActiveRecord::Base
  attr_accessible :nome

  has_many :projeto
end
