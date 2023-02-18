Ruby Version: 2.7.7p221
RSpec Version: 3.12.0

The project has a `Gemfile`, to install dependencies run `bundle`

Run using interactive ruby console
```
irb -r ./tax_solver.rb
```

For each input, create an instance of the class `TaxSolver` and call the method `solve`
```
TaxSolver.new.solve
```

After that, the program will be waiting for the input. Is assumed that the input ends after an empty line

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

```

Its also posible to pass the input via an array, as the first parameter to the function solve

```
TaxSolver.new.solve(
['2 book at 12.49',
'1 music CD at 14.99',
'1 chocolate bar at 0.85']
)
```

The output will be displayed in the console

Run the tests using
```
rspec 
```
