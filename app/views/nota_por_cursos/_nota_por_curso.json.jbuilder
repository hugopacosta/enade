json.extract! nota_por_curso, :id, :faculdade_id, :curso_id, :nota, :media_alunos, :created_at, :updated_at
json.url nota_por_curso_url(nota_por_curso, format: :json)
