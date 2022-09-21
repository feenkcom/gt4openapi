Class {
	#name : #GtOpenApiServer,
	#superclass : #Object,
	#instVars : [
		'url',
		'description',
		'variables'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiServer >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiServer >> description: anObject [

	description := anObject
]

{ #category : #printing }
GtOpenApiServer >> printOn: aStream [
	super printOn: aStream.

	self url ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: self url asString;
		nextPut: $)
]

{ #category : #accessing }
GtOpenApiServer >> url [

	^ url
]

{ #category : #accessing }
GtOpenApiServer >> url: anObject [

	url := anObject
]

{ #category : #accessing }
GtOpenApiServer >> variables [

	^ variables
]

{ #category : #accessing }
GtOpenApiServer >> variables: anObject [

	variables := anObject
]
