Class {
	#name : #BaselineOfGToolkit4OpenAPI,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4OpenAPI
}

{ #category : #accessing }
BaselineOfGToolkit4OpenAPI >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'GToolkit4OpenAPI' ]
]
