Class {
	#name : #GtOpenApiContact,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'name',
		'url',
		'email'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiContact >> accept: aVisitor [
	^ aVisitor visitGtOpenApiContact: self
]

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
