class Cliente < ActiveRecord::Base
  attr_accessible :nome, :users

  has_and_belongs_to_many :users

  def label
   nome
  end
end
