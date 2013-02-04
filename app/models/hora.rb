#encoding: utf-8
class Hora < ActiveRecord::Base
  belongs_to :atividade
  belongs_to :programador
  attr_accessible :quantas, :programador_id
  validates_numericality_of :quantas
end
