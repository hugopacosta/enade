class NotaPorCurso < ApplicationRecord

  belongs_to :faculdade, optional: true
  belongs_to :curso, optional: true

end
