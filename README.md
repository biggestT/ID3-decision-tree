ID3 Decision Tree creator
--------

Attempt to implement the ID3 decision tree algorithm in Octave. Takes a .csv file as input and prints tree to console.
Currently no penalty for multi-variate attributes so I suggest you only use binary valued attributes.

## Usage
Example of using training data from example.csv with the first column as target attribute and the rest as input attributes:
``` bash
octave-cli
octave:1> id3('example.csv', 1, [2:4])
employed value: 0 (70%)
   rich value: 0 (57%)
      not happy
   rich value: 1 (86%)
      married value: 0 (67%)
         happy most likely (50%)
      married value: 1 (67%)
         happy
employed value: 1 (40%)
   not happy
```


