# complex_analysis

### What it is
The purpose of this repository is identifying what a complex number is, comprising a Real (`Re`) and Imaginary (`Im`) part, where `Im` can contain: **a)** some number part, and **b)** some `iota` and an exponent part.

#### Euclidean Plane

Represented some ordered pair, what some may call a Tuple, of two numbers within the Sets of Real Numbers (R).

We can work with this plane like so:

```ruby
ab = EuclideanPlane.new(1)
ab.draw
=> 

 |
- -
 |

ab = EuclideanPlane.new(2)
ab.draw
=> 

  |
  |
-- --
  |
  |

ab = EuclideanPlane.new(3)
ab.draw
=> 

   |
   |
   |
--- ---
   |
   |
   |

```

#### Complex Plane

What makes the Complex Plane different, is the second item in the Tuple (on the y-axis) is within the Set of Complex Numbers (C), and thus the y-axis comprises a set of Imaginary (Im) Numbers.

#### Real (Re) numbers
Real numbers, represented as R, are all true Real numbers. In practice, we can represent an ordered pair on a graph through a Tuple of two Real Numbers. In strict Mathematics this is represented as some coordinate within R^2, i.e. a Euclidean Plane.

#### Imaginary (Im) numbers
Imaginary numbers represent a base, e.g. some number within all real numbers, and `i` (representing square root of -1) with some exponent, identifying evaluated result of `i`

Thus, this work can receive things like `3 + 3i^5` and appropriately: 

1. convert: **a)** `i^5` to `i`, and **b)** `i^6` to `-1`
2. identify `3` as `Re` (real), and
3. also identify `3i` as `Im` (imaginary)

These are accomplished thorugh through finding the mod of some exponent on a disk of imaginary numbers, as they are represented within the iota and exponent cycle.

### How it Works
```
ab = ComplexNumber.new("3 + 3i")

# Complex Conjugate
ab.complex_conjugate.a
=> "3 - 3i"

# (Re) - real part
ab.re
=> "3"

# (Im) - imaginary part
ab.im
=> "3i"
```


### Analyzing Work
Given `rspec` is installed, calling `rspec` goes through a series of test cases on `ComplexNumber`, `ComplexPlane`, and `EuclideanPlane`.
