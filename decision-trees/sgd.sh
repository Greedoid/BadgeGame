#!/bin/bash

mkdir bin

make


#creates ARff files
java -cp lib/weka.jar:bin FeatureGenerator ../badges/badges.modified.data.all ./../badges.total.arff
java -cp lib/weka.jar:bin FeatureGenerator ../badges/badges.modified.data.fold1 ./../badges.total1.arff
java -cp lib/weka.jar:bin FeatureGenerator ../badges/badges.modified.data.fold2 ./../badges.total2.arff
java -cp lib/weka.jar:bin FeatureGenerator ../badges/badges.modified.data.fold3 ./../badges.total3.arff
java -cp lib/weka.jar:bin FeatureGenerator ../badges/badges.modified.data.fold4 ./../badges.total4.arff
java -cp lib/weka.jar:bin FeatureGenerator ../badges/badges.modified.data.fold5 ./../badges.total5.arff

#appends the data to isolate the folds
java -cp lib/weka.jar weka.core.Instances append ./../badges.total1.arff ./../badges.total2.arff > ./merges/12.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total2.arff ./../badges.total3.arff > ./merges/23.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total3.arff ./../badges.total4.arff > ./merges/34.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total4.arff ./../badges.total5.arff > ./merges/45.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total1.arff ./../badges.total3.arff > ./merges/13.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total1.arff ./../badges.total4.arff > ./merges/14.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total1.arff ./../badges.total5.arff > ./merges/15.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total2.arff ./../badges.total4.arff > ./merges/24.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total2.arff ./../badges.total5.arff > ./merges/25.arff
java -cp lib/weka.jar weka.core.Instances append ./../badges.total3.arff ./../badges.total5.arff > ./merges/35.arff

java -cp lib/weka.jar weka.core.Instances append ./merges/13.arff ./merges/45.arff > ./merges/1345.arff
java -cp lib/weka.jar weka.core.Instances append ./merges/12.arff ./merges/34.arff > ./merges/1234.arff
java -cp lib/weka.jar weka.core.Instances append ./merges/23.arff ./merges/45.arff > ./merges/2345.arff
java -cp lib/weka.jar weka.core.Instances append ./merges/12.arff ./merges/45.arff > ./merges/1245.arff
java -cp lib/weka.jar weka.core.Instances append ./merges/12.arff ./merges/35.arff > ./merges/1235.arff

#runs sgd with default alpha at 10^-3 and convergence threshold at .02
java -cp lib/weka.jar:bin sgd  ./merges/2345.arff ./../badges.total1.arff .001 .02 
java -cp lib/weka.jar:bin sgd  ./merges/1234.arff ./../badges.total5.arff .001 .02
java -cp lib/weka.jar:bin sgd  ./merges/1345.arff ./../badges.total2.arff .001 .02
java -cp lib/weka.jar:bin sgd  ./merges/1245.arff ./../badges.total3.arff .001 .02
java -cp lib/weka.jar:bin sgd  ./merges/1235.arff ./../badges.total4.arff .001 .02

