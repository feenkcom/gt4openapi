Class {
	#name : #GtOpenApiServerVariable,
	#superclass : #Object,
	#instVars : [
		'enum',
		'default',
		'description'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

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
