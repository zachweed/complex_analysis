# complex_analysis

### What it is
The purpose of this repository is identifying what a complex number is, comprising a Real (`Re`) and Imaginary (`Im`) part, where `Im` can contain: **a)** some number part, and **b)** some `iota` and an exponent part.

Thus, this work can receive things like `3 + 3i^5` and appropriately: 

1. convert: **a)** `i^5` to `i`, and **b)** `i^6` to `-1`
2. identify `3` as `Re` (real), and
3. also identify `3i` as `Im` (imaginary)

These are accomplished thorugh through finding the mod of some exponent on a disk of imaginary numbers, as they are represented within the iota and exponent cycle.


### Analyzing Work
Given `rspec` is installed, calling `rspec` goes through a series of test cases on `ComplexNumber` and `ComplexPlane`.

### Goals

1. Identify complex numbers, within a complex plane, in **polar form**, through defining **polar coordinates**.
2. Representing the **absolute value** of some complex coordinate in a complex plane.
3. Allow for **addition**, **subtraction**, and **multiplication** of these complex numbers.
