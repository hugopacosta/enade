class NotaPorCurso < ApplicationRecord

  belongs_to :faculdade, optional: true
  belongs_to :curso, optional: true

  validates :faculdade_id, uniqueness: { scope: :curso_id }
  validates :nota, numericality: { greater_than_or_equal_to: 0, message:"deve ser maior que 0" }
  validates :media_alunos, numericality: { greater_than_or_equal_to: 0, message:"deve ser maior que 0" }

  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'nota_geral_desc' },
    available_filters: [
      :sorted_by,
      :busca_faculdade,
      :busca_curso,
      :media_acima,
      :nota_geral_acima,
      :nota_curso_acima
    ]
  )

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("nota_por_cursos.created_at #{ direction }")
    when /^media_/
      order("nota_por_cursos.media_alunos #{ direction }")
    when /^nota_geral_/
      order("faculdades.nota #{ direction }").joins(:faculdade)
    when /^nome_faculdade_/
      order("faculdades.nome #{ direction }").joins(:faculdade)
    when /^nome_curso_/
      order("cursos.nome_do_curso #{ direction }").joins(:curso)
    when /^nota_curso_/
      order("nota_por_cursos.nota #{ direction }").joins(:curso)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :busca_faculdade, lambda { |nome|
    return nil  if nome.blank?
    where('faculdades.nome ILIKE ?', "%#{nome}%").joins(:faculdade)
  }

  scope :busca_curso, lambda { |curso|
    where('cursos.nome_do_curso ILIKE ?', "%#{curso}%").joins(:curso)
  }

  scope :media_acima, lambda { |media|
    where('media_alunos >= ?', media)
  }

  scope :nota_geral_acima, lambda { |nota|
    where('faculdades.nota >= ?', nota).joins(:faculdade)
  }

  scope :nota_curso_acima, lambda { |nota|
    where('nota_por_cursos.nota >= ?', nota)
  }

  def self.options_for_sorted_by
    [
      ['Nome da Faculdade (a-z)', 'nome_faculdade_asc'],
      ['Nome do Curso', 'nome_curso_asc'],
      ['Nota Geral', 'nota_geral_desc'],
      ['Nota do Curso', 'nota_curso_desc'],
      ['Média dos Alunos', 'media_desc']
    ]
  end

end
