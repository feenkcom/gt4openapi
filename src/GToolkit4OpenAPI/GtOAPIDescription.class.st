Class {
	#name : #GtOAPIDescription,
	#superclass : #GtOBase,
	#instVars : [
		'info'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOAPIDescription >> components: anObject [ 
]

{ #category : #accessing }
GtOAPIDescription >> externalDocs: anObject [ 
]

{ #category : #accessing }
GtOAPIDescription >> info: aDictionary [ 
	info := GtOInfo new rawData:aDictionary.
]

{ #category : #accessing }
GtOAPIDescription >> openApiVersion [
	^ rawData at:'openapi' ifAbsent:'Version info not available'
]

{ #category : #accessing }
GtOAPIDescription >> paths: anObject [ 
]

{ #category : #accessing }
GtOAPIDescription >> rawData: aDictionary [
	super rawData: aDictionary.
	self info: (rawData at:'info' ifAbsent: Dictionary new).
	self servers: (rawData at:'servers' ifAbsent: Dictionary new).
	self paths: (rawData at:'paths' ifAbsent: Dictionary new).
	self components: (rawData at:'components' ifAbsent: Dictionary new).
	self security: (rawData at:'security' ifAbsent: Dictionary new).
	self tags: (rawData at:'tags' ifAbsent: Dictionary new).
	self externalDocs: (rawData at:'externalDocs' ifAbsent: Dictionary new).
]

{ #category : #accessing }
GtOAPIDescription >> security: anObject [ 
]

{ #category : #accessing }
GtOAPIDescription >> servers: anObject [ 
]

{ #category : #accessing }
GtOAPIDescription >> tags: anObject [ 
]
