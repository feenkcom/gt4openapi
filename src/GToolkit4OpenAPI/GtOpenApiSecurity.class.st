Class {
	#name : #GtOpenApiSecurity,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiSecurity >> accept: aVisitor [
	^ aVisitor visitGtOpenApiSecurity: self
]
