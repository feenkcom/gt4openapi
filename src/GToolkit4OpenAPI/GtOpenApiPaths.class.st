Class {
	#name : #GtOpenApiPaths,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'paths'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiPaths >> accept: aVisitor [
	^ aVisitor visitGtOpenApiPaths: self
]

{ #category : #accessing }
GtOpenApiPaths >> paths [

	^ paths
]

{ #category : #accessing }
GtOpenApiPaths >> paths: anObject [

	paths := anObject
]
