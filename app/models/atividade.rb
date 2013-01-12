class Atividade < ActiveRecord::Base
  attr_accessible :descricao, :projeto_id, :horas

  belongs_to :projeto
  has_many :horas
  validates_associated :horas
  validates_presence_of :projeto_id
end
