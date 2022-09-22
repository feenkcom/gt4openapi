Class {
	#name : #GtOpenApiLicense,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'name',
		'url'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiLicense >> accept: aVisitor [
	^ aVisitor visitGtOpenApiLicense: self
]

{ #category : #accessing }
GtOpenApiLicense >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiLicense >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GtOpenApiLicense >> url [

	^ url
]

{ #category : #accessing }
GtOpenApiLicense >> url: anObject [

	url := anObject
]
