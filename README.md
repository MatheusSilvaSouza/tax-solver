## Dependencies 

Ruby Version: 2.7.7p221

RSpec Version: 3.12.0

**The project has a `Gemfile`, to install dependencies run `bundle`**

## Execution

Run using interactive ruby console
```
irb -r ./tax_solver.rb
```

Create an instance of the class `TaxSolver` and, for each input, call the method `solve`
```
TaxSolver.new.solve
```

After that, the program will be waiting for the input. Its assumed that the input ends after an empty line

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

```

It's also possible to pass the input via an string as the parameter to the function solve.
Each line of the input should still divided by a `\n` (line break)

```
TaxSolver.new.solve("2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85\n\n")
```

The output will be displayed in the console

## Testing

Run the tests using
```
rspec 
```


## Assumptions

- Each line of the input represents a product, and will contain information regarding its name and price as well as the amount bougth
- The input end is defined by an empty line
- All lines in the input will contain a whole number at the start to represent the amount of products, with no characters or spaces before it, and it will have a space after it
- All lines in the input will end with ` at #`, where `#` represents any decimal number
- If a product has `imported` anywhere on its line, import duty will be charged
- Products exempt of basic sales tax will contain the folling words anywhere in its line
  - book
  - chocolate
  - pills

