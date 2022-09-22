Class {
	#name : #GtOpenApiSecurity,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiSecurity >> accept: aVisitor [
	^ aVisitor visitGtOpenApiSecurity: self
]
