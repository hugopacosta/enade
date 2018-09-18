class NotaPorCurso < ApplicationRecord

  belongs_to :faculdade, optional: true
  belongs_to :curso, optional: true

  def self.media_acima(media)
    if media
      where('media_alunos > ?', "#{media}")
    else
      all
    end
  end

  def self.busca_faculdade(nome_faculdade)
    if nome_faculdade
      joins(:faculdade).where('LOWER(nome) LIKE ?', "%#{nome_faculdade}%")
    else
      all
    end
  end

  def self.busca_curso(nome_curso)
    if nome_curso
      joins(:curso).where('LOWER(nome_do_curso) LIKE ?', "%#{nome_curso}%")
    else
      all
    end
  end
end
