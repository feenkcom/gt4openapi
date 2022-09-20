Class {
	#name : #GtOpenApiRequestBody,
	#superclass : #Object,
	#instVars : [
		'description',
		'content',
		'isRequired'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiRequestBody >> content [

	^ content
]

{ #category : #accessing }
GtOpenApiRequestBody >> content: anObject [

	content := anObject
]

{ #category : #accessing }
GtOpenApiRequestBody >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiRequestBody >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiRequestBody >> isRequired [

	^ isRequired
]

{ #category : #accessing }
GtOpenApiRequestBody >> isRequired: anObject [

	isRequired := anObject
]
