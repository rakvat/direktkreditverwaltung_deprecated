module PdfHelper

  def currency n
    @view.number_to_currency(n)
  end

  def fraction n
    @view.number_to_percentage(n * 100)
  end

end
