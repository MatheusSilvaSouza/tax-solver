require_relative "../tax_solver"
require "stringio"

RSpec.describe TaxSolver do
  context "Using TaxSolver.new.solve with string parameter to solve" do
    ts = TaxSolver.new

    it "Input 1:" do
      expect do ts.solve("2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85") end.to output(
        "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n",
      ).to_stdout

      expect(ts.sale_taxes).to eq "1.50"
      expect(ts.total).to eq "42.32"
    end

    it "Input 2:" do
      expect do ts.solve("1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50") end.to output(
        "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15\n",
      ).to_stdout

      expect(ts.sale_taxes).to eq "7.65"
      expect(ts.total).to eq "65.15"
    end

    it "Input 3:" do
      expect do
        ts.solve(
          "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n3 imported boxes of chocolates at 11.25",
        )
      end.to output(
        "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38\n",
      ).to_stdout

      expect(ts.sale_taxes).to eq "7.90"
      expect(ts.total).to eq "98.38"
    end
  end

  context "Using TaxSolver.new.solve and stdin to solve" do
    ts = TaxSolver.new

    it "Input 1:" do
      expect do
        $stdin = StringIO.new("2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85\n\n")
        ts.solve
        $stdin = STDIN
      end.to output("2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n").to_stdout

      expect(ts.sale_taxes).to eq "1.50"
      expect(ts.total).to eq "42.32"
    end

    it "Input 2:" do
      expect do
        $stdin = StringIO.new("1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50\n\n")
        ts.solve
        $stdin = STDIN
      end.to output("1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15\n").to_stdout

      expect(ts.sale_taxes).to eq "7.65"
      expect(ts.total).to eq "65.15"
    end

    it "Input 3:" do
      expect do
        $stdin =
          StringIO.new(
            "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n3 imported boxes of chocolates at 11.25\n\n",
          )
        ts.solve
        $stdin = STDIN
      end.to output(
        "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38\n",
      ).to_stdout

      expect(ts.sale_taxes).to eq "7.90"
      expect(ts.total).to eq "98.38"
    end
  end
end
