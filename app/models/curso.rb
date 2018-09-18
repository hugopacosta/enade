class Curso < ApplicationRecord
  has_many :nota_por_cursos
  has_many :faculdades, through: :nota_por_cursos
end
