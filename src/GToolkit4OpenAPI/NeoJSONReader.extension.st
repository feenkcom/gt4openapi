Extension { #name : #NeoJSONReader }

{ #category : #'*GToolkit4OpenAPI' }
NeoJSONReader >> peekPropertyName [
	"We want to figure out what object we want to read 
	based on the first parameter name (dictionary key)."

	| stream |
	stream := readStream clone.

	[ stream atEnd not and: [ stream peek isSeparator ] ]
		whileTrue: [ stream next ].

	(stream peekFor: ${) ifFalse: [ self error: '{ expected' ].

	[ stream atEnd not and: [ stream peek isSeparator ] ]
		whileTrue: [ stream next ].

	(stream peekFor: $") ifFalse: [ self error: '" expected' ].
	^ stream upTo: $"
]
