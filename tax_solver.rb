class TaxSolver
  attr_reader :sale_taxes, :total

  def solve(input = nil)
    unless input
      input = []
      while (line = gets) != "\n"
        input << line
      end
    end

    @sale_taxes = 0
    @total = 0

    input.map do |line|
      amount = line.split(" ").first.to_i
      @product = line.split(" at ").first.strip
      price = line.split(" at ").last.strip.to_f

      tax = 0
      tax += 0.1 if taxable_product?
      tax += 0.05 if apply_import_tax?

      tax_per_unit = ((price * tax) * 20).ceil / 20.0
      tax_value = amount * tax_per_unit

      product_total = (amount * price) + tax_value

      puts("#{@product}: %.2f" % product_total)

      @sale_taxes += tax_value
      @total += product_total
    end

    @sale_taxes = sprintf("%.2f", @sale_taxes)
    @total = sprintf("%.2f", @total)

    puts("Sales Taxes: #{@sale_taxes}")
    puts("Total: #{@total}")
  end

  def taxable_product?
    !@product.match(/book|chocolate|pills/)
  end

  def apply_import_tax?
    @product.match(/imported/)
  end
end
