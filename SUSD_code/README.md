# The Speeding-Up and Slowing-Down (SUSD) Optimization Algorithm
This repository contains the MATLAB implementation of the Speeding-Up and Slowing-Down (SUSD) strategy, a sample-efficient derivative-free solution for optimization.

## Examples
Running the SUSD examples for a quadratic objective function
- run **simple_exp_search_example.m** script
  - solves a d-dimensional quadratic problem with N agents using the exponential
  mapping detailed in LCSS
  - modify susd_search.m to change parameters of search behavior

- run **graphical_2D_example.m** script
  - solves a 2D quadratic problem and shows an animation using the exponential 
  mapping detailed in LCSS

- run **simple_search_example.m** script
  - solves a d-dimensional quadratic problem with N agents using the vanilla
  SUSD method

To change the objective function, create a new function like **quadratic.m** and
pass a new function handle for z

Note: N must be greater than or equal to d
Note: larger N tends to produce more accurate results

## Cite this work
```
@article{}, 
title = {A Derivative-Free Optimization Method with Application to Functions with Exploding and Vanishing Gradients},
author = {Al-Abri, Said and Lin, Tony X. and Tao, Molei and Zhang, Fumin },
doi = {10.1109/LCSYS.2020.3004747}, 
issn = {24751456}, 
issue = {2}, 
journal = {IEEE Control Systems Letters},  
volume = {5}, 
year = {2021}, }
```

## Contact
Tony X. Lin (Email: tlin339@gatech.edu)
Shengkang Chen (Email: schen754@gatech.edu)