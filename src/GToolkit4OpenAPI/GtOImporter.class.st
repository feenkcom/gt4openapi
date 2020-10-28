"
```
aGtOapi := GtOImporter fromString: json. 
options := GtOCodeGenOptions new.
options modelBaseClassName: 'ModelBase'.
options modelClassPrefix: 'GtDe'.
options modelPackage: 'GToolkit4DockerEngine'.
aGtOapi components codeGenOptions: options.
aGtOapi components generateApiClient.
```
"
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
