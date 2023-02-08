class Dealership

  attr_reader :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.length
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    @inventory.length != 0
  end

  def cars_by_make(this_make)
    @inventory.map{|car| car if car.make == this_make}.compact
  end

  def total_value
    current_value = 0
    @inventory.each{|car| current_value += car.total_cost}
    current_value
  end

  def details
    details_hash = {"total_value" => self.total_value, "address" => @address}
  end

end