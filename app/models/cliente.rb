class Cliente < ActiveRecord::Base
  attr_accessible :nome
  def label 
   nome 
  end
end
