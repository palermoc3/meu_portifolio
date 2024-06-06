# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :user
  has_many :payrolls

  validates :ctps, numericality: { only_integer: true }, length: { is: 10 }
  validates :salary_base, numericality: { greater_than: 0, message: 'Deve ser maior que zero' }
  validates :commission_percent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
