class TaxSolver
  def solve()
    input = []
    while (line = gets) != "\n"
      input << line
    end
    sale_taxes = 0
    total = 0
    input.map do |inp|
      amount = inp.split(" ").first.to_i
      product_name = inp.split(" at ").first.strip
      price = inp.split(" at ").last.strip.to_f
      tax = 0
      tax += 0.1 if taxable_product?(product_name)
      tax += 0.05 if apply_import_tax?(product_name)

      price_amount = amount * price
      tax_per_unit = ((price * tax) * 20).ceil / 20.0
      tax_value = amount * tax_per_unit
      product_total = price_amount + tax_value

      puts "#{product_name}: %.2f" % product_total

      sale_taxes += tax_value
      total += product_total
    end

    puts "Sales Taxes: %.2f" % sale_taxes
    puts "Total: %.2f" % total
  end

  def taxable_product?(product_name)
    !product_name.match(/book|chocolate|pills/)
  end

  def apply_import_tax?(product_name)
    product_name.match(/imported/)
  end
end
