require_relative '../tax_solver'

RSpec.describe TaxSolver, "#input" do
  context "Use TaxSolver to solver " do
    ts = TaxSolver.new()
    it "Input 1:" do
      ts.solve(["2 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"])

      expect(ts.sale_taxes).to eq "1.50"
      expect(ts.total).to eq "42.32"
    end
    it "Input 2:" do
      ts.solve(["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"])

      expect(ts.sale_taxes).to eq "7.65"
      expect(ts.total).to eq "65.15"
    end
    it "Input 3:" do
      ts.solve(
        [
          "1 imported bottle of perfume at 27.99",
          "1 bottle of perfume at 18.99",
          "1 packet of headache pills at 9.75",
          "3 imported boxes of chocolates at 11.25",
        ],
      )

      expect(ts.sale_taxes).to eq "7.90"
      expect(ts.total).to eq "98.38"
    end
  end
end