require "application_system_test_case"

class ItemPurchasesTest < ApplicationSystemTestCase
  setup do
    @item_purchase = item_purchases(:one)
  end

  test "visiting the index" do
    visit item_purchases_url
    assert_selector "h1", text: "Item purchases"
  end

  test "should create item purchase" do
    visit item_purchases_url
    click_on "New item purchase"

    fill_in "Product", with: @item_purchase.product_id
    fill_in "Purchase", with: @item_purchase.purchase_id
    fill_in "Quantity", with: @item_purchase.quantity
    fill_in "Value", with: @item_purchase.value
    click_on "Create Item purchase"

    assert_text "Item purchase was successfully created"
    click_on "Back"
  end

  test "should update Item purchase" do
    visit item_purchase_url(@item_purchase)
    click_on "Edit this item purchase", match: :first

    fill_in "Product", with: @item_purchase.product_id
    fill_in "Purchase", with: @item_purchase.purchase_id
    fill_in "Quantity", with: @item_purchase.quantity
    fill_in "Value", with: @item_purchase.value
    click_on "Update Item purchase"

    assert_text "Item purchase was successfully updated"
    click_on "Back"
  end

  test "should destroy Item purchase" do
    visit item_purchase_url(@item_purchase)
    click_on "Destroy this item purchase", match: :first

    assert_text "Item purchase was successfully destroyed"
  end
end
