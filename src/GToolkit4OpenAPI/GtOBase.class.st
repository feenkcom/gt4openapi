Class {
	#name : #GtOBase,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOBase >> rawData [
	^ rawData
]

{ #category : #accessing }
GtOBase >> rawData: dictionary [ 
	rawData := dictionary
]
