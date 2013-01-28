class Cliente < ActiveRecord::Base
  attr_accessible :nome

  has_many :projeto

  def label
   nome
  end
end
