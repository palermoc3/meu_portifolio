# frozen_string_literal: true

json.array! @payrolls, partial: 'payrolls/payroll', as: :payroll
