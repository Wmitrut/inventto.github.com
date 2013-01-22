class Programador < ActiveRecord::Base
  attr_accessible :nome, :descricao

  def label
    nome
  end
end
