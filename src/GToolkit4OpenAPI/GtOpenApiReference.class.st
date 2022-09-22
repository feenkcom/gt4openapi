Class {
	#name : #GtOpenApiReference,
	#superclass : #Object,
	#instVars : [
		'ref'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #printing }
GtOpenApiReference >> gtDisplayOn: aStream [
	self ref
		ifNil: [ super gtDisplayOn: aStream.
			^ self ].

	aStream
		nextPutAll: 'Reference to ';
		nextPutAll: self ref asString
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtPropertiesViewTypeString [
	^ 'reference'
]

{ #category : #printing }
GtOpenApiReference >> printOn: aStream [
	super printOn: aStream.
	self ref ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: self ref asString;
		nextPut: $)
]

{ #category : #accessing }
GtOpenApiReference >> ref [

	^ ref
]

{ #category : #accessing }
GtOpenApiReference >> ref: anObject [

	ref := anObject
]
