class Potluck
  attr_reader :date, :dishes

  def initialize(date_arg)
    @date =   date_arg
    @dishes = []
  end

  def add_dish(add_dish_arg)
    @dishes << add_dish_arg
  end





end
