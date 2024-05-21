class Administrator < ApplicationRecord
  belongs_to :user
  has_one :store
  validates :cnpj, presence: true, if: :updating?
  validates :cnpj, format: { with: /\A\d{14}\z/, message: 'must have 14 digits' }, if: :updating?

  private

  def updating?
    persisted?
  end
end
