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

  def average_price_of_car
    average = self.total_value / @inventory.length
    average = average.to_s.chars.to_a.reverse.each_slice(3) # I stole this code from the internet - I hope that's okay!
    average.map(&:join).join(',').reverse # this line too
  end

  def cars_sorted_by_price
    cars_sorted = @inventory.sort {|a,b| a.total_cost <=> b.total_cost}
  end

  def inventory_hash
    brands = @inventory.map{|car| car.make}
    unique_brands = brands.uniq
    i_hash = {}
    unique_brands.each do |brand|
      i_hash.store(brand,self.cars_by_make(brand))
    end
    i_hash
  end

end