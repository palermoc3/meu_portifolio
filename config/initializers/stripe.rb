# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: 'pk_test_51PF485LqpMH2SBzFBoKhKK8K3Fpex5wYtAFK8eaAyfwmqptEPV5pqf3iSUpdVIIw4DyWVTAUcv91ZF79f9j5ERia00O9zcekLG',
  secret_key: 'sk_test_51PF485LqpMH2SBzF2K78Cj2t9ArIj2BlDtUa96O73jP5eIjkdgK3rwH2dD8xHzFvNHg6IX1tUZxAKtpSX7MhFMOs00Dtcbaoj0'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
