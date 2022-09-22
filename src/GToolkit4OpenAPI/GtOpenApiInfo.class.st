Class {
	#name : #GtOpenApiInfo,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'title',
		'description',
		'termsOfService',
		'contact',
		'license',
		'version'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiInfo >> accept: aVisitor [
	^ aVisitor visitGtOpenApiInfo: self
]

{ #category : #accessing }
GtOpenApiInfo >> contact [

	^ contact
]

{ #category : #accessing }
GtOpenApiInfo >> contact: anObject [

	contact := anObject
]

{ #category : #accessing }
GtOpenApiInfo >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiInfo >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiInfo >> license [

	^ license
]

{ #category : #accessing }
GtOpenApiInfo >> license: anObject [

	license := anObject
]

{ #category : #enumerating }
GtOpenApiInfo >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	"do nothing"
]

{ #category : #accessing }
GtOpenApiInfo >> termsOfService [

	^ termsOfService
]

{ #category : #accessing }
GtOpenApiInfo >> termsOfService: anObject [

	termsOfService := anObject
]

{ #category : #accessing }
GtOpenApiInfo >> title [

	^ title
]

{ #category : #accessing }
GtOpenApiInfo >> title: anObject [

	title := anObject
]

{ #category : #accessing }
GtOpenApiInfo >> version [

	^ version
]

{ #category : #accessing }
GtOpenApiInfo >> version: anObject [

	version := anObject
]
