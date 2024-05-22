require 'test_helper'

class ItemPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_purchase = item_purchases(:one)
  end

  test 'should get index' do
    get item_purchases_url
    assert_response :success
  end

  test 'should get new' do
    get new_item_purchase_url
    assert_response :success
  end

  test 'should create item_purchase' do
    assert_difference('ItemPurchase.count') do
      post item_purchases_url,
           params: { item_purchase: { product_id: @item_purchase.product_id, purchase_id: @item_purchase.purchase_id,
                                      quantity: @item_purchase.quantity, value: @item_purchase.value } }
    end

    assert_redirected_to item_purchase_url(ItemPurchase.last)
  end

  test 'should show item_purchase' do
    get item_purchase_url(@item_purchase)
    assert_response :success
  end

  test 'should get edit' do
    get edit_item_purchase_url(@item_purchase)
    assert_response :success
  end

  test 'should update item_purchase' do
    patch item_purchase_url(@item_purchase),
          params: { item_purchase: { product_id: @item_purchase.product_id, purchase_id: @item_purchase.purchase_id,
                                     quantity: @item_purchase.quantity, value: @item_purchase.value } }
    assert_redirected_to item_purchase_url(@item_purchase)
  end

  test 'should destroy item_purchase' do
    assert_difference('ItemPurchase.count', -1) do
      delete item_purchase_url(@item_purchase)
    end

    assert_redirected_to item_purchases_url
  end
end
