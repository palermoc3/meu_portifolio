employee = User.create!(
  name: 'Nome do Usuário',
  cpf: '12345678901',
  email: 'pedro@pedro.com',
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 2,
  password: 'pedro@pedro',
  password_confirmation: 'pedro@pedro',
  kind: true,
  phone: '21980117423',
  role: 2
)

# Criar um empregado associado ao usuário
Employee.create!(
  user: employee,
  ctps: '1234567890',
  salary_base: 6000.0,
  hours: 35,
  commission_percent: 0.2
)

# Encontre todos os employees
Employee.all.each do |employee|
  # Verifique se o usuário associado tem a role 2
  next unless employee.user.role == 2

  # Se o usuário tiver a role 2, gere payrolls para os últimos 2 meses
  (1..2).each do |month_ago|
    date = Date.today.prev_month(month_ago).beginning_of_month
    # Crie a lógica para gerar os payrolls para cada mês
    payroll = Payroll.create(
      date_of_payroll: date,
      commission: 0,
      discount: 0,
      salary: employee.salary_base,
      description: 'Fase de teste',
      employee_id: employee.id
    )
  end
end

administrator = User.create!(
  name: 'Administrator',
  cpf: '12345678903',
  email: 'adm@adm.com',
  state: 'RJ',
  cep: '20000001',
  street: 'Rua',
  number: 1,
  password: 'pedro@pedro',
  password_confirmation: 'pedro@pedro',
  kind: true,
  phone: '21983117423',
  role: 1
)

# Criar um empregado associado ao usuário
admin = Administrator.create!(
  user: administrator,
  cnpj: '12345678901234'
)

# Crie a loja associada ao administrador
store = Store.create!(
  kind: 1, # Exemplo de tipo de loja
  theme: 1, # Exemplo de tema da loja
  payroll_day: 5, # Exemplo do dia de pagamento da folha
  administrator: admin, # Associe o administrador à loja
  logo: File.open('app/assets/images/logo.jpg'),
  name: 'Cactus Bijuu',
  facebook: 'https://www.facebook.com/pedropalermomartins/',
  instagram: 'https://www.instagram.com/martins_pedro97/?next=%2F',
  twitter: 'https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoicHQifQ%3D%3D%22%7D'
)

# Crie a post associada a loja
About.create!(
  title: 'testando', # Exemplo de tipo de loja
  about_text: 'falamos como se criar um post para desenvolver conteudos da loja', # Exemplo de tema da loja
  store: store, # Associe o administrador à loja
  image: File.open("app/assets/images/#{rand(1..9)}.jpeg")
)

# Crie a post associada a loja
About.create!(
  title: 'primeiro post', # Exemplo de tipo de loja
  about_text: 'falamos como se criar um post para desenvolver conteudos da lojafalamos como se criar um post para desenvolver conteudos da lojafalamos como se criar um post para desenvolver conteudos da lojafalamos como se criar um post para desenvolver conteudos da lojafalamos como se criar um post para desenvolver conteudos da lojafalamos como se criar um post para desenvolver conteudos da loja', # Exemplo de tema da loja
  store: store, # Associe o administrador à loja
  image: File.open("app/assets/images/#{rand(1..9)}.jpeg")
)

Department.create!(name: 'Home')
electronics = Department.create!(name: 'Electronics')
Department.create!(name: 'Computers and Accessories')
Department.create!(name: 'Commerce')
Department.create!(name: 'Leisure and Entertainment')
Department.create!(name: 'Automotive')
toys = Department.create!(name: 'Toys')
Department.create!(name: 'Sports')
Department.create!(name: 'Health and Wellness')
Department.create!(name: 'Fashion and Beauty')

Category.create!(name: 'luz externa', department_id: electronics.id)
Category.create!(name: 'luz interna', department_id: electronics.id)
Category.create!(name: 'luz sala', department_id: electronics.id)
Category.create!(name: 'luz cozinha', department_id: electronics.id)
Category.create!(name: 'luz banheiro', department_id: electronics.id)
Category.create!(name: 'luz quarto', department_id: electronics.id)
Category.create!(name: 'luz piscina', department_id: electronics.id)
Category.create!(name: 'luz neutra', department_id: electronics.id)
Category.create!(name: 'brinquedo masc', department_id: toys.id)
fem = Category.create!(name: 'brinquedo fem', department_id: toys.id)
Category.create!(name: 'brinquedo neutro', department_id: toys.id)
Category.create!(name: 'brinquedo online', department_id: toys.id)

(1..21).each do |_i|
  value_buy = Faker::Commerce.price(range: 10.0..49.0, as_string: false).to_f
  value_sell = Faker::Commerce.price(range: (value_buy + 1.0)..(value_buy + 20.0), as_string: false).to_f

  Product.create!(
    name: Faker::Commerce.product_name,
    weight: 0.5,
    width: 1.2,
    length: 0.6,
    depth: 0.2,
    quantity: 20,
    valueSell: value_sell,
    valueBuy: value_buy,
    description: Faker::Lorem.sentence(word_count: 3),
    category_id: fem.id,
    photo1: File.open("app/assets/images/#{rand(1..9)}.jpeg"),
    photo2: File.open("app/assets/images/#{rand(1..9)}.jpeg"),
    photo3: File.open("app/assets/images/#{rand(1..9)}.jpeg")
  )
end
