require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'
require 'pry'

class PotluckTest < Minitest::Test

  def setup
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
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

end
