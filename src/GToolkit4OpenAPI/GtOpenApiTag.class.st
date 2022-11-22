Class {
	#name : #GtOpenApiTag,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'name',
		'description',
		'externalDocs'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiTag >> accept: aVisitor [
	^ aVisitor visitGtOpenApiTag: self
]

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

{ #category : #'gt - extensions' }
GtOpenApiTag >> gtPathsViewDescriptionText [
	^ self description ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiTag >> gtPathsViewOperationsText [
	^ ''
]

{ #category : #testing }
GtOpenApiTag >> isTag [
	^ true
]

{ #category : #accessing }
GtOpenApiTag >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiTag >> name: anObject [

	name := anObject
]

{ #category : #enumerating }
GtOpenApiTag >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self externalDocs ifNotNil: [ :anObject | anObject withObjectsDo: aBlock ]
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
