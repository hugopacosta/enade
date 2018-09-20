class NotaPorCurso < ApplicationRecord

  belongs_to :faculdade, optional: true
  belongs_to :curso, optional: true

  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :busca_faculdade,
      :busca_curso,
      :media_acima
    ]
  )

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("nota_por_cursos.created_at #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :media_acima, lambda { |media|
    where('media_alunos >= ?', media)
  }

  scope :busca_faculdade, lambda { |nome|
    where('faculdades.nome ILIKE ?', "%#{nome}%").joins(:faculdade)
  }

  scope :busca_curso, lambda { |curso_ids|
    where(:curso_id => [*curso_ids])
  }

end
