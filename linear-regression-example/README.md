# Linear regression in Leo - example

This is a simple Leo example of univariate linear regression (LR) implemented in Leo for use in a zkSNARK. The method implemented is Ordinary Least Squares, a standard approach to LR. Running this Leo program computes the LR model of a set of training data points and stores the LR model, consisting of a slope and an offset, in an Aleo record.

## Usage guide

Make sure you have [Leo installed](https://developer.aleo.org/getting_started/). You can modify the input values as needed. Each x and y pair represents a data point for the linear regression model. You can also modify the number of training data points by changing the code.

To compile and run this Leo program, run:
```bash
leo run main "{ p1: {x: -1000i32,y: -1500i32}, p2: {x: 0i32,y: 800i32}, p3: {x: 500i32,y: 2000i32}, p4: {x: 1500i32,y: 4000i32}, p5: {x: 2300i32,y: 6000i32}}"
```
The output will look something like this:

```bash
Leo Compiled 'main.leo' into Aleo instructions
Leo ✅ Built 'lr1.aleo' (in "/linear-regression/build")
⛓  Constraints
 •  'lr1.aleo/main' - 8,144 constraints (called 1 time)
➡️  Output
 • {
  owner: ...,
  slope: 2i32.private,
  offset: 940i32.private,
  _nonce: ...
}
Leo ✅ Executed 'lr1.aleo/main' (in "/linear-regression/build")
```

Here `owner` is the address of the caller, `offset` and `slope` are the computed LR model parameters, and `_nonce` is a unique identifier.

## Further optimizations and future work
### Computational accuracy
The current approach works reasonably well if the value ranges in the x and y coordinates are high and accuracy requirements are limited because Leo natively supports integer variables but no floating-point numbers. To achieve higher computational accuracy, you can implement fixed-point numbers, similar to how they are used for neural networks in Leo (see these resources: [fixed-point arithmetic in Leo](https://www.aleo.org/post/fixed-point-arithmetic-in-the-zksnark-based-programming-language-leo), [building neural networks with fixed-point arithmetic in Leo](https://www.aleo.org/post/neural-network-inference-with-the-zksnark-based-programming-language-leo-using-fixed-point-arithmetic)). In the example above, the results were `2` for the slope and `940` for the offset, whereas the more exact results are `2.24` and `778.49`.

### Constraint efficiency
For larger datasets or in cases with a high number of independent variables, circuit sizes can grow large, and constraint efficiency becomes crucial. One promising approach, described in section 7.2 of [this paper](https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-wu.pdf), is to verify that the LR model was correctly computed, rather than computing it directly within the proof (which would require costly matrix inversions). The utility of both methods should be similar in most practical cases, as they both aim to verify the correctness of the model.