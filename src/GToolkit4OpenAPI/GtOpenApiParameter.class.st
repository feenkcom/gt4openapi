Class {
	#name : #GtOpenApiParameter,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject + TGtOpenApiWithFields',
	#classTraits : 'TGtOpenApiObject classTrait + TGtOpenApiWithFields classTrait',
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiParameter >> accept: aVisitor [
	^ aVisitor visitGtOpenApiParameter: self
]

{ #category : #accessing }
GtOpenApiParameter >> gtParameterViewNameText [
	| aText |
	aText := self name asRopedText.

	self isRequired
		ifTrue: [ aText bold
				append: (' (required)' asRopedText foreground: BrGlamorousColors disabledButtonTextColor) ].

	self isDeprecated
		ifTrue: [ aText
				lineThroughDo: [ :anAttribute |  ];
				italic;
				append: (' (deprecated)' asRopedText
						foreground: BrGlamorousColors disabledButtonTextColor) ].

	^ aText
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
GtOpenApiParameter >> isDeprecated [
	^ self fieldAt: #isDeprecated ifAbsent: [ false ]
]

{ #category : #accessing }
GtOpenApiParameter >> isRequired [
	^ self fieldAt: #isRequired ifAbsent: [ false ]
]

{ #category : #enumerating }
GtOpenApiParameter >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self schema ifNotNil: [ :aSchema | aSchema withObjectsDo: aBlock ].
	self flag: #todo
]

{ #category : #accessing }
GtOpenApiParameter >> schema [
	^ self fieldAt: #schema
]
