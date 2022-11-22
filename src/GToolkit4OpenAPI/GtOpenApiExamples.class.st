Class {
	#name : #GtOpenApiExamples,
	#superclass : #Object,
	#category : #'GToolkit4OpenAPI-Examples'
}

{ #category : #accessing }
GtOpenApiExamples >> openApi301Json [
	<gtExample>
	^ STONJSON fromString: self openApi301JsonString
]

{ #category : #accessing }
GtOpenApiExamples >> openApi301JsonString [
	<gtExample>
	^ '{
		"openapi":"3.0.1",
		"info": {
  				"title": "Sample Pet Store App",
  				"description": "This is a sample server for a pet store.",
  				"termsOfService": "http://example.com/terms/",
  				"contact": {
    				"name": "API Support",
    				"url": "http://www.example.com/support",
    				"email": "support@example.com"
  				},
  				"license": {
    				"name": "Apache 2.0",
    				"url": "https://www.apache.org/licenses/LICENSE-2.0.html"
  				},
  		"version": "1.0.1"
		},
		"servers": [
    		{
      		"url": "https://development.gigantic-server.com/v1",
     		 "description": "Development server",
     		 "variables": {
					"username": {
						"default": "demo",
						"description": "this value is assigned by the service provider, in this example `gigantic-server.com`"
        			},
					"port": {
						"enum": [
							"8443",
							"443"
						],
						"default": "8443"
					},
					"basePath": {
						"default": "v2"
					}
				}
    		},
    		{
     		 "url": "https://staging.gigantic-server.com/v1",
      		"description": "Staging server"
    		},
    		{
      		"url": "https://api.gigantic-server.com/v1",
      		"description": "Production server"
    		}
  		],
  	"paths": {
  "/pets": {
    "get": {
      "description": "Returns all pets from the system that the user has access to",
      "responses": {
        "200": {          
          "description": "A list of pets.",
          "content": {
            "application/json": {
              "schema": {
                "type": "array",
                "items": {
                  "$ref": "#/components/schemas/pet"
                }
              }
            }
          }
        }
      }
    }
  }
}
	}'
]

{ #category : #accessing }
GtOpenApiExamples >> openApi301Object [
	<gtExample>
	| anOpenApi |
	anOpenApi := self parser readString: self openApi301JsonString.

	self assert: anOpenApi isNotNil.

	^ anOpenApi
]

{ #category : #accessing }
GtOpenApiExamples >> openApiMediaTypeJsonString [
	<gtExample>
	^ '{
  "application/json": {
    "schema": {
         "$ref": "#/components/schemas/Pet"
    },
    "examples": {
      "cat" : {
        "summary": "An example of a cat",
        "value": 
          {
            "name": "Fluffy",
            "petType": "Cat",
            "color": "White",
            "gender": "male",
            "breed": "Persian"
          }
      },
      "dog": {
        "summary": "An example of a dog with a cat''s name",
        "value" :  { 
          "name": "Puma",
          "petType": "Dog",
          "color": "Black",
          "gender": "Female",
          "breed": "Mixed"
        },
      "frog": {
          "$ref": "#/components/examples/frog-example"
        }
      }
    }
  }
}'
]

{ #category : #accessing }
GtOpenApiExamples >> openApiMediaTypeObject [
	<gtExample>
	| aDictionary aMediaType |
	aDictionary := self parser
			read: (GtOpenApiMappingUtility nameOfDictionary: GtOpenApiMediaType)
			string: self openApiMediaTypeJsonString.

	self assert: aDictionary isNotNil.
	self assert: (aDictionary includesKey: 'application/json').
	self assert: (aMediaType := aDictionary at: 'application/json') isNotNil.

	self assert: aMediaType isNotNil.
	self assert: aMediaType schema isNotNil.
	self assert: aMediaType schema isReference.
	self assert: aMediaType schema ref equals: '#/components/schemas/Pet'.
	self assert: aMediaType examples size equals: 2.

	^ aDictionary
]

{ #category : #accessing }
GtOpenApiExamples >> openApiPathItemJsonString [
	<gtExample>
	^ '{
  "get": {
    "description": "Returns pets based on ID",
    "summary": "Find pets by ID",
    "operationId": "getPetsById",
    "responses": {
      "200": {
        "description": "pet response",
        "content": {
          "*/*": {
            "schema": {
              "type": "array",
              "items": {
                "$ref": "#/components/schemas/Pet"
              }
            }
          }
        }
      },
      "default": {
        "description": "error payload",
        "content": {
          "text/html": {
            "schema": {
              "$ref": "#/components/schemas/ErrorModel"
            }
          }
        }
      }
    }
  },
  "parameters": [
    {
      "name": "id",
      "in": "path",
      "description": "ID of pet to use",
      "required": true,
      "schema": {
        "type": "array",
        "items": {
          "type": "string"
        }
      },
      "style": "simple"
    }
  ]
}'
]

{ #category : #accessing }
GtOpenApiExamples >> openApiPathItemObject [
	<gtExample>
	| anOpenApi a200Code |
	anOpenApi := self parser
			read: GtOpenApiPathItem
			string: self openApiPathItemJsonString.

	self assert: anOpenApi isNotNil.
	self assert: anOpenApi get isNotNil.
	self assert: anOpenApi get description equals: 'Returns pets based on ID'.
	self assert: anOpenApi get summary equals: 'Find pets by ID'.
	self assert: anOpenApi get operationId equals: 'getPetsById'.
	self assert: anOpenApi get responses size equals: 2.
	self assert: anOpenApi get responses default isNotNil.
	self assert: (a200Code := anOpenApi get responses atCode: 200) isNotNil.

	self assert: a200Code description equals: 'pet response'.

	^ anOpenApi
]

{ #category : #accessing }
GtOpenApiExamples >> parser [
	<gtExample>
	^ GtOpenApiParser
]
