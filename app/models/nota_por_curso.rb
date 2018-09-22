class NotaPorCurso < ApplicationRecord

  belongs_to :universidade, optional: true
  belongs_to :curso, optional: true

  validates :universidade_id, uniqueness: { scope: :curso_id }
  validates :nota, numericality: { greater_than_or_equal_to: 0, message:"deve ser maior que 0" }
  validates :media_alunos, numericality: { greater_than_or_equal_to: 0, message:"deve ser maior que 0" }

  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'nota_geral_desc' },
    available_filters: [
      :sorted_by,
      :busca_universidade,
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
      order("universidades.nota #{ direction }").joins(:universidade)
    when /^nome_universidade_/
      order("universidades.nome #{ direction }").joins(:universidade)
    when /^nome_curso_/
      order("cursos.nome_do_curso #{ direction }").joins(:curso)
    when /^nota_curso_/
      order("nota_por_cursos.nota #{ direction }").joins(:curso)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :busca_universidade, lambda { |nome|
    return nil  if nome.blank?
    where('universidades.nome ILIKE ?', "%#{nome}%").joins(:universidade)
  }

  scope :busca_curso, lambda { |curso|
    where('cursos.nome_do_curso ILIKE ?', "%#{curso}%").joins(:curso)
  }

  scope :media_acima, lambda { |media|
    where('media_alunos >= ?', media)
  }

  scope :nota_geral_acima, lambda { |nota|
    where('universidades.nota >= ?', nota).joins(:universidade)
  }

  scope :nota_curso_acima, lambda { |nota|
    where('nota_por_cursos.nota >= ?', nota)
  }

  def self.options_for_sorted_by
    [
      ['Nome da Universidade', 'nome_universidade_asc'],
      ['Nome do Curso', 'nome_curso_asc'],
      ['Maior Nota Geral', 'nota_geral_desc'],
      ['Menor Nota Geral', 'nota_geral_asc'],
      ['Maior Nota do Curso', 'nota_curso_desc'],
      ['Menor Nota do Curso', 'nota_curso_asc'],
      ['Maior Média dos Alunos', 'media_desc'],
      ['Menor Média dos Alunos', 'media_asc']
    ]
  end

end
