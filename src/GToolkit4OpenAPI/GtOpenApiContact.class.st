Class {
	#name : #GtOpenApiContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'url',
		'email'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiContact >> email [

	^ email
]

{ #category : #accessing }
GtOpenApiContact >> email: anObject [

	email := anObject
]

{ #category : #accessing }
GtOpenApiContact >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiContact >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GtOpenApiContact >> url [

	^ url
]

{ #category : #accessing }
GtOpenApiContact >> url: anObject [

	url := anObject
]
