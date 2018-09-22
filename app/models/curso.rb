class Curso < ApplicationRecord
  validates :nome_do_curso, presence: { message: "não informado!" }
  validates_uniqueness_of :nome_do_curso, :message => "Curso já cadastrado!", :case_sensitive => false

  has_many :nota_por_cursos, :dependent => :delete_all
end
