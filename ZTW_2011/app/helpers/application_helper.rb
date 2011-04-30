module ApplicationHelper

  def format_price(price)
    zl = price.to_s
    gr = zl.slice!(-2..-1)
    zl + "," + gr + " zl"
  end
end
