Extension { #name : #Collection }

{ #category : #'*GToolkit4OpenAPI' }
Collection >> gtOpenApiParameterViewText [
	^ self size asString , (' item' asPluralBasedOn: self size)
]

{ #category : #'*GToolkit4OpenAPI' }
Collection >> gtOpenApiStructureViewText [
	^ self size asString , (' item' asPluralBasedOn: self size)
]
