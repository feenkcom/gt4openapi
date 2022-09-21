Class {
	#name : #GtOpenApiTag,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'externalDocs'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiTag >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiTag >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiTag >> externalDocs [

	^ externalDocs
]

{ #category : #accessing }
GtOpenApiTag >> externalDocs: anObject [

	externalDocs := anObject
]

{ #category : #accessing }
GtOpenApiTag >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiTag >> name: anObject [

	name := anObject
]

{ #category : #printing }
GtOpenApiTag >> printOn: aStream [
	super printOn: aStream.

	self name ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]
