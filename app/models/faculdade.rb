class Faculdade < ApplicationRecord
  validates_uniqueness_of :nome, :message => "Faculdade já cadastrada!"

  has_many :nota_por_cursos
end
