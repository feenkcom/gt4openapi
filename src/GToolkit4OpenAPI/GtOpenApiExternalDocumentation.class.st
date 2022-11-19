Class {
	#name : #GtOpenApiExternalDocumentation,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'description',
		'url'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiExternalDocumentation >> accept: aVisitor [
	^ aVisitor visitGtOpenApiExternalDocumentation: self
]

{ #category : #accessing }
GtOpenApiExternalDocumentation >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiExternalDocumentation >> description: anObject [

	description := anObject
]

{ #category : #enumerating }
GtOpenApiExternalDocumentation >> objectsDo: aBlock [
	"No Objects to iterate"
]

{ #category : #accessing }
GtOpenApiExternalDocumentation >> url [

	^ url
]

{ #category : #accessing }
GtOpenApiExternalDocumentation >> url: anObject [

	url := anObject
]
