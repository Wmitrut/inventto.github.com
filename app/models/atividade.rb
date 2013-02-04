class Atividade < ActiveRecord::Base
  attr_accessible :descricao, :projeto_id, :horas

  scope :do_cliente, lambda {|cliente_id| joins(:projeto).where("projetos.cliente_id = ?", cliente_id)}
  scope :do_projeto, lambda {|projeto_id| where "atividades.projeto_id = ?", projeto_id}
  scope :do_programador, lambda {|programador_id| joins(:horas).where("horas.programador_id = ?", programador_id)}
  scope :do_dia, lambda {|data| entre data, data+1.day}
  scope :entre, lambda {|de,ate| where "atividades.created_at between ? and ?", de, ate}

  belongs_to :projeto
  has_many :horas
  validates_associated :horas
  validates_presence_of :horas
  validates_presence_of :projeto_id
end
