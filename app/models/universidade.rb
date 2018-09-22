class Universidade < ApplicationRecord

  validates :nome, presence: { message: "não informado!" }
  validates_uniqueness_of :nome, :message => "Universidade já cadastrado!", :case_sensitive => false
  validates :nota, presence: { message: "não informada!" }, allow_blank: false
  validates :nota, numericality: { greater_than_or_equal_to: 0, message:"deve ser maior que 0" }

  has_many :nota_por_cursos, :dependent => :delete_all

end
