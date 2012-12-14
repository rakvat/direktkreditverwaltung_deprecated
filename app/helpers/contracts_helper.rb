module ContractsHelper
  def currency value
    number_to_currency(value, :locale => :de)
  end

  def fraction value
    number_to_percentage(value * 100)
  end
end
