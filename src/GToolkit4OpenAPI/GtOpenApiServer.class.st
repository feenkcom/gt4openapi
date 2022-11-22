Class {
	#name : #GtOpenApiServer,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'url',
		'description',
		'variables'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiServer >> accept: aVisitor [
	^ aVisitor visitGtOpenApiServer: self
]

{ #category : #accessing }
GtOpenApiServer >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiServer >> description: anObject [

	description := anObject
]

{ #category : #enumerating }
GtOpenApiServer >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self variables do: [ :eachVariable | eachVariable withObjectsDo: aBlock ]
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
	^ variables ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiServer >> variables: anObject [

	variables := anObject
]
