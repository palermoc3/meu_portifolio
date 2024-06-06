# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :administrator
  has_one_attached :logo

  validates :payroll_day, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 28 }
  validates :facebook,
            format: { with: %r{\Ahttps://www\.facebook\.com/}, message: 'deve começar com https://www.facebook.com/' }, allow_blank: true
  validates :instagram,
            format: { with: %r{\Ahttps://www\.instagram\.com/}, message: 'deve começar com https://www.instagram.com/' }, allow_blank: true
  validates :twitter, format: { with: %r{\Ahttps://twitter\.com/}, message: 'deve começar com https://twitter.com/' },
                      allow_blank: true
end
