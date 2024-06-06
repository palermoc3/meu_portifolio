# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  belongs_to :department
  after_create :increment_department_quantity
  after_destroy :decrement_department_quantity

  before_validation :set_default_quantity

  validates :name, presence: { message: 'Não pode ser vazio' },
                   format: { with: /\p{L}+/, message: 'Deve conter apenas letras' }, uniqueness: { message: 'Esse nome já foi cadastrado.' }
  validates :department, presence: { message: 'Deve ser associado a uma departamento' }

  private

  def set_default_quantity
    self.quantity ||= 0
  end

  def increment_department_quantity
    department.increment!(:quantity)
  end

  def decrement_department_quantity
    department.decrement!(:quantity)
  end
end
