require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'
require 'pry'

class PotluckTest < Minitest::Test

  def setup
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
  end

  def test_that_it_exists
    potluck = Potluck.new("7-13-18")

    assert_instance_of Potluck, potluck
  end

  def test_that_it_has_a_date_attribute
    potluck = Potluck.new("7-13-18")

    assert_equal "7-13-18", potluck.date
  end

  def test_that_potluck_starts_with_no_dishes
    potluck = Potluck.new("7-13-18")

    assert_equal [], potluck.dishes
  end

  def test_that_dishes_can_be_added_to_the_potluck
    potluck = Potluck.new("7-13-18")
    potluck.add_dish(@couscous_salad)
    potluck.add_dish(@cocktail_meatballs)

    expected = @couscous_salad, @cocktail_meatballs
    assert_equal expected, potluck.dishes
  end

  def test_that_the_number_of_potluck_dishes_can_be_counted
    potluck = Potluck.new("7-13-18")
    potluck.add_dish(@couscous_salad)
    potluck.add_dish(@cocktail_meatballs)

    assert_equal 2, potluck.dishes.count
  end

  def test_that_all_dishes_can_be_shown_by_category
    potluck = Potluck.new("7-13-18")
    potluck.add_dish(@couscous_salad)
    potluck.add_dish(@cocktail_meatballs)
    potluck.add_dish(@summer_pizza)

    assert_equal [@couscous_salad, @summer_pizza], potluck.get_all_from_category(:appetizer)
    assert_equal [@cocktail_meatballs], potluck.get_all_from_category(:entre)
  end

  def test_that_you_can_find_first_dish_item_of_the_category
    potluck = Potluck.new("7-13-18")
    potluck.add_dish(@couscous_salad)
    potluck.add_dish(@cocktail_meatballs)
    potluck.add_dish(@summer_pizza)
    potluck.add_dish(@roast_pork)

    assert_equal @couscous_salad, potluck.get_all_from_category(:appetizer).first
    assert_equal @cocktail_meatballs, potluck.get_all_from_category(:entre).first
  end

  def test_that_you_can_get_the_name_of_the_fist_dish_of_the_category
    potluck = Potluck.new("7-13-18")
    potluck.add_dish(@couscous_salad)
    potluck.add_dish(@cocktail_meatballs)
    potluck.add_dish(@summer_pizza)
    potluck.add_dish(@roast_pork)

    assert_equal "Couscous Salad", potluck.get_all_from_category(:appetizer).first.name
    assert_equal "Cocktail Meatballs", potluck.get_all_from_category(:entre).first.name
  end

end
