class Faculdade < ApplicationRecord
  validates_uniqueness_of :nome, :message => "Faculdade já cadastrada!"

  scope :nomeDaFaculdade, -> (nome) { where nome: nome }

  has_many :nota_por_cursos
  has_many :cursos, through: :nota_por_cursos
end
