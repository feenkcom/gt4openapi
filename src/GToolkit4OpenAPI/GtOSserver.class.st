Class {
	#name : #GtOSserver,
	#superclass : #GtOBase,
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOSserver >> url [
	^ rawData at: 'url' ifAbsent: nil
]
