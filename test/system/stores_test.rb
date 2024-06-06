# frozen_string_literal: true

require 'application_system_test_case'

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:one)
  end

  test 'visiting the index' do
    visit stores_url
    assert_selector 'h1', text: 'Stores'
  end

  test 'should create store' do
    visit stores_url
    click_on 'New store'

    fill_in 'Administrator', with: @store.administrator_id
    fill_in 'Facebook', with: @store.facebook
    fill_in 'Instagram', with: @store.instagram
    fill_in 'Kind', with: @store.kind
    fill_in 'Name', with: @store.name
    fill_in 'Payroll day', with: @store.payroll_day
    fill_in 'Theme', with: @store.theme
    fill_in 'Twitter', with: @store.twitter
    click_on 'Create Store'

    assert_text 'Store was successfully created'
    click_on 'Back'
  end

  test 'should update Store' do
    visit store_url(@store)
    click_on 'Edit this store', match: :first

    fill_in 'Administrator', with: @store.administrator_id
    fill_in 'Facebook', with: @store.facebook
    fill_in 'Instagram', with: @store.instagram
    fill_in 'Kind', with: @store.kind
    fill_in 'Name', with: @store.name
    fill_in 'Payroll day', with: @store.payroll_day
    fill_in 'Theme', with: @store.theme
    fill_in 'Twitter', with: @store.twitter
    click_on 'Update Store'

    assert_text 'Store was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Store' do
    visit store_url(@store)
    click_on 'Destroy this store', match: :first

    assert_text 'Store was successfully destroyed'
  end
end
