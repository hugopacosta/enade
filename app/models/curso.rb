class Curso < ApplicationRecord
  has_many :nota_por_cursos
  has_many :faculdades, through: :nota_por_cursos


  def self.options_for_select
    order('LOWER(nome_do_curso)').map { |e| [e.nome_do_curso, e.id] }
  end
end
