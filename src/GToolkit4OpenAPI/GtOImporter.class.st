Class {
	#name : #GtOImporter,
	#superclass : #Object,
	#category : #GToolkit4OpenAPI
}

{ #category : #accessing }
GtOImporter class >> fromString: jsonString [
	|dictionary|
	dictionary := STONJSON fromString:jsonString. 
	^ GtOAPIDescription new rawData: dictionary. 
]
