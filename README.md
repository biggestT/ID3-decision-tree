ID3 Decision Tree creator
--------

Attempt to implement the ID3 decision tree algorithm in Octave. Takes a .csv file as input and prints tree to console.
Currently no penalty for multi-variate attributes so I suggest you only use binary valued attributes.

## Usage
example.csv:
```
happy,married,employed,alive
0,0,0,1
1,1,1,1
0,1,0,1
...
```

``` bash
octave-cli
octave:1> id3('example.csv', 1, [2:4])
employed value: 0 (55%)
   married value: 0 (67%)
      alive value: 1 (100%)
         not happy most likely (50%)
   married value: 1 (67%)
      happy
employed value: 1 (45%)
   alive value: 0 (80%)
      happy
   alive value: 1 (80%)
      married value: 1 (100%)
         happy most likely (75%)
```


