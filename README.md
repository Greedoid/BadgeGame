Kevin Jasieniecki, jasieni2@illinois.edu


Enter decision-trees for all of the interesting stuff
to run, ./ on any of the executable .sh files will be sufficient

- src: This contains the java sources. This contains five files:
   1. Id3.java: A modified version of Weka's Id3 code, which can be trained upto a limited depth.

   2. FeatureGenerator.java: An example feature generator that generates features in the ARFF format.

   3. WekaTester.java: The decision tree generator, with the wekatester named for posterity / laziness. Needs 3 arguments to run: training set, testing set, and tree depth

   4. sgd.java: The general SGD executable, needing 4 arguments to run: training set, testing set, alpha (learning) constant, and convergence threshold. 

   5. Stumper.java: The 100 random stump generator version of sgd. Needs the same number of arguments as sgd.java, and has a lot of repeated code.

- lib: This contains the weka.jar corresponding to Weka v3.6.3
  
- executables: 

  1. fulltree.sh runs the decision tree algorithm on the five folds, using full length trees

  2. 4stump.sh runs the decision tree algorithm on the five folds, stumping at a depth of 4

  3. 8stump.sh does the same thing as 4stump.sh, but with a depth of 8

  4. sgd.sh runs the general sgd algorithm on the five folds, using default values alpha = .001 and convergence threshold = .02

  5. stumpsgd.sh runs the random decision stump sgd algorithm on the five folds with default values alpha = .01 and convergence threshold = .02

- Makefile: A makefile to compile the java code

- merges: Contains different combinations of .arff data, retrieved and merged from badges, used to isolate folds in teh executables

- data: Contains items of interest:

  1. trees has the best-performing trees from the full tree, 8-stump, and 4-stump runs

  2. alphaTrials contains runs of sgd using different alpha values with a fixed convergence threshold
 
  3. convergeTrials contains runs of sgd using different convergence thresholds with fixed alpha

  4. DecisionStumpSgd contains a sample run of the decision stumpped sgd algorithm, showing total accuracies over five folds 

  5. stumperAlphaTrials is the same as alphaTrials, but for the stumps-as-features sgd implementation

  6. stumperConvergeTrials is the same as convergeTrials, but for the stumps-as-features sgd implementation
