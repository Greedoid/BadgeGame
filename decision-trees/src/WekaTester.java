import java.io.File;
import java.io.FileReader;

import weka.classifiers.Evaluation;
import weka.core.Instances;
import cs446.weka.classifiers.trees.Id3;

public class WekaTester {

    public static void main(String[] args) throws Exception {

	if (args.length != 3) {
	    System.err.println("Usage: WekaTester arff-file");
	    System.exit(-1);
	}

	// Load the data
	Instances trainData = new Instances(new FileReader(new File(args[0])));
	Instances testData = new Instances(new FileReader(new File(args[1])));
	int depth = Integer.parseInt(args[2]);

	// The last attribute is the class label
	trainData.setClassIndex(trainData.numAttributes() - 1);
	testData.setClassIndex(testData.numAttributes() - 1);

	// Train on 80% of the data and test on 20%
	Instances train = trainData;
	Instances test = testData;

	// Create a new ID3 classifier. This is the modified one where you can
	// set the depth of the tree.
	Id3 classifier = new Id3();

	classifier.setMaxDepth(depth);

	//Build Classifier
	classifier.buildClassifier(train);

	// Print the classfier
	System.out.println(classifier);
	System.out.println();

	// Evaluate on the test set
	Evaluation evaluation = new Evaluation(test);
	evaluation.evaluateModel(classifier, test);
	System.out.println(evaluation.toSummaryString());

    }
}
