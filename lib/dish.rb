class Dish
  attr_reader :name, :category

  def initialize(name_arg, category_arg)
    @name = name_arg
    @category = category_arg
  end
end
