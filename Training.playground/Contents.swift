import Foundation
import CreateML
import CreateMLUI

let url = Bundle.main.url(forResource: "russian_names_xcode", withExtension: "json")
let data = try MLDataTable(contentsOf: url!)

let algorithm = MLTextClassifier.ModelAlgorithmType.maxEnt(revision: 1)
let parameters = MLTextClassifier.ModelParameters(validationData: [:], algorithm: algorithm, language: .russian)
let model = try MLTextClassifier(trainingData: data, textColumn: "name", labelColumn: "label", parameters: parameters)

let metadata = MLModelMetadata(author: "Gleb", shortDescription: "Names", license: "", version: "0,1")

try model.write(toFile: "/Users/glebshendrik/dev/mac/SmartSearch/SmartSearch/Resources/names.mlmodel", metadata: metadata)
