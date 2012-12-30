# encoding: utf-8
module ApplicationHelper
  def currency value
    number_to_currency(value, :locale => :de)
  end

  def latex_currency value
    number_to_currency(value, :locale => :de).gsub("€","\\euro")
  end

  def fraction value
    number_to_percentage(value * 100)
  end
end
