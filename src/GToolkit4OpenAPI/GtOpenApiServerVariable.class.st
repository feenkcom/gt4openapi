Class {
	#name : #GtOpenApiServerVariable,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'enum',
		'default',
		'description'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiServerVariable >> accept: aVisitor [
	^ aVisitor visitGtOpenApiServerVariable: self
]

{ #category : #accessing }
GtOpenApiServerVariable >> default [

	^ default
]

{ #category : #accessing }
GtOpenApiServerVariable >> default: anObject [

	default := anObject
]

{ #category : #accessing }
GtOpenApiServerVariable >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiServerVariable >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiServerVariable >> enum [

	^ enum
]

{ #category : #accessing }
GtOpenApiServerVariable >> enum: anObject [

	enum := anObject
]

{ #category : #enumerating }
GtOpenApiServerVariable >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	"Do nothing"

	
]
