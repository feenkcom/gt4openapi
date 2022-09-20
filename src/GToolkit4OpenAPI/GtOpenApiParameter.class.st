Class {
	#name : #GtOpenApiParameter,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'isRequired',
		'isDeprecated',
		'allowEmptyValue',
		'inLocation'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiParameter >> allowEmptyValue [

	^ allowEmptyValue
]

{ #category : #accessing }
GtOpenApiParameter >> allowEmptyValue: anObject [

	allowEmptyValue := anObject
]

{ #category : #accessing }
GtOpenApiParameter >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiParameter >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiParameter >> gtParametersViewStatusText [
	| aText |
	aText := '' asRopedText.
	self isRequired ifTrue: [ aText append: 'required' asRopedText bold ].
	self isDeprecated
		ifTrue: [ aText size isZero ifFalse: [ aText append: '/' asRopedText ].
			aText append: 'deprecated' asRopedText ].

	aText size isZero
		ifTrue: [ aText
				append: ('optional' asRopedText foreground: BrGlamorousColors disabledButtonTextColor) ].

	^ aText
]

{ #category : #accessing }
GtOpenApiParameter >> inLocation [

	^ inLocation
]

{ #category : #accessing }
GtOpenApiParameter >> inLocation: anObject [

	inLocation := anObject
]

{ #category : #accessing }
GtOpenApiParameter >> isDeprecated [
	^ isDeprecated ifNil: [ false ]
]

{ #category : #accessing }
GtOpenApiParameter >> isDeprecated: anObject [

	isDeprecated := anObject
]

{ #category : #accessing }
GtOpenApiParameter >> isRequired [
	^ isRequired ifNil: [ false ]
]

{ #category : #accessing }
GtOpenApiParameter >> isRequired: anObject [

	isRequired := anObject
]

{ #category : #accessing }
GtOpenApiParameter >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiParameter >> name: anObject [

	name := anObject
]
