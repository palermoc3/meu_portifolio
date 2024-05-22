class About < ApplicationRecord
  belongs_to :store

  has_one_attached :image

  validates :title, presence: { message: 'Não pode ser vazio' }
end
