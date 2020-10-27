Class {
	#name : #GtOSchema,
	#superclass : #GtOBase,
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOSchema >> generateModelClassUsing: codeGenerator [
	|properties|
	properties := self properties.
	properties ifNotNil: [
		codeGenerator generateClassFor: self withProperties: properties].
]

{ #category : #accessing }
GtOSchema >> properties [
	|properties|
	(self type = 'object') ifTrue: [properties := rawData at: 'properties' ifAbsent:[ nil]].
	(self type = 'array') ifTrue: [properties := (rawData at: 'items') at: 'properties'].
	^ properties
]

{ #category : #accessing }
GtOSchema >> type [ 
	^ rawData at: 'type' ifAbsent: [ (rawData keys) asString]
]
