Class {
	#name : #GtOpenApiResponse,
	#superclass : #Object,
	#instVars : [
		'description',
		'headers',
		'content',
		'links'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiResponse >> content [

	^ content
]

{ #category : #accessing }
GtOpenApiResponse >> content: anObject [

	content := anObject
]

{ #category : #accessing }
GtOpenApiResponse >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiResponse >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiResponse >> headers [

	^ headers
]

{ #category : #accessing }
GtOpenApiResponse >> headers: anObject [

	headers := anObject
]

{ #category : #accessing }
GtOpenApiResponse >> links [

	^ links
]

{ #category : #accessing }
GtOpenApiResponse >> links: anObject [

	links := anObject
]
