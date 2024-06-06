# frozen_string_literal: true

json.array! @administrators, partial: 'administrators/administrator', as: :administrator
