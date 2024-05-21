class Department < ApplicationRecord
    has_many :categories
  
    before_validation :set_default_quantity
    validates :name, presence: { message: 'Não pode ser vazio' },
                     format: { with: /\p{L}+/, message: 'Deve conter apenas letras' }, uniqueness: { message: 'Esse nome já foi cadastrado.' }
  
    enum name: {
      'Electronics' => 'Electronics',
      'Computers and Accessories' => 'Computers and Accessories',
      'Commerce' => 'Commerce',
      'Home' => 'Home',
      'Leisure and Entertainment' => 'Leisure and Entertainment',
      'Automotive' => 'Automotive',
      'Toys' => 'Toys',
      'Sports' => 'Sports',
      'Health and Wellness' => 'Health and Wellness',
      'Fashion and Beauty' => 'Fashion and Beauty'
    }
  
    validates :name, inclusion: { in: names.keys.map(&:to_s) }
  
    private
  
    def set_default_quantity
      self.quantity ||= 0
    end
  end