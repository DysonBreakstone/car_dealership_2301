class Car

    attr_reader :make, :model, :monthly_payment, :loan_length, :total_cost

  def initialize(make_model, monthly_payment, loan_length)
    make_and_model = make_model.split(" ")
    @make = make_and_model[0]
    @model = make_and_model[1]
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @total_cost = monthly_payment * loan_length
  end


end