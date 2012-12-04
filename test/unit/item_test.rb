require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "cannot_save_without_name" do
    i = Item.new
    i.price = 10
    assert !i.save, "It is possible to save an Item without 'name'"
  end

  test "cannot_save_without_price" do
    i = Item.new
    i.name = 'anything'
    assert !i.save,  "It is possible to save an Item without 'price'"
  end

  test "search_with_empty_parameters" do
	found_items = Item.search('', nil)
  	assert (found_items.length == 2), "Item search wasn't working properly with empty parameter."
  end

  test "search_for_name" do
  	found_items = Item.search('fagott', nil)
  	assert (found_items.length == 1) && (found_items[0] == items(:fagott)), "Item search wasn't working properly."
  end

  test "order_by_name" do
  	found_items = Item.search('', 0) # order by name
  	assert (found_items[0] == items(:fagott)) && (found_items[1] == items(:zongora)), "Item ordering was not working properly."
  end

  test "order_by_price" do
	found_items = Item.search('', 1) # order by price
  	assert (found_items[0] == items(:zongora)) && (found_items[1] == items(:fagott)), "Item ordering was not working properly."
  end

end
