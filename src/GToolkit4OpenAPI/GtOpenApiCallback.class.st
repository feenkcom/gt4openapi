Class {
	#name : #GtOpenApiCallback,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiCallback >> accept: aVisitor [
	^ aVisitor visitGtOpenApiCallback: self
]
