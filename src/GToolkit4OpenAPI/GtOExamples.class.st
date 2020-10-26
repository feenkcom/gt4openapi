Class {
	#name : #GtOExamples,
	#superclass : #Object,
	#category : #'GToolkit4OpenAPI-Examples'
}

{ #category : #accessing }
GtOExamples >> components [
	<gtExample>
	|components|
	components := STONJSON fromString: self componentsJson.
	^ GtOComponents new rawData: (components value).
]

{ #category : #accessing }
GtOExamples >> componentsJson [
	^ '"components": {
  "schemas": {
    "Category": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "name": {
          "type": "string"
        }
      }
    },
    "Tag": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "name": {
          "type": "string"
        }
      }
    }
  },
  "parameters": {
    "skipParam": {
      "name": "skip",
      "in": "query",
      "description": "number of items to skip",
      "required": true,
      "schema": {
        "type": "integer",
        "format": "int32"
      }
    },
    "limitParam": {
      "name": "limit",
      "in": "query",
      "description": "max records to return",
      "required": true,
      "schema" : {
        "type": "integer",
        "format": "int32"
      }
    }
  },
  "responses": {
    "NotFound": {
      "description": "Entity not found."
    },
    "IllegalInput": {
      "description": "Illegal input for operation."
    },
    "GeneralError": {
      "description": "General Error",
      "content": {
        "application/json": {
          "schema": {
            "$ref": "#/components/schemas/GeneralError"
          }
        }
      }
    }
  },
  "securitySchemes": {
    "api_key": {
      "type": "apiKey",
      "name": "api_key",
      "in": "header"
    },
    "petstore_auth": {
      "type": "oauth2",
      "flows": {
        "implicit": {
          "authorizationUrl": "http://example.org/api/oauth/dialog",
          "scopes": {
            "write:pets": "modify pets in your account",
            "read:pets": "read your pets"
          }
        }
      }
    }
  }
}'
]

{ #category : #accessing }
GtOExamples >> openApi [
	<gtExample>
	|oa|
	oa := GtOImporter fromString: self openApiJson.
	self assert: oa info isNotNil.
	self assert: oa servers size = 3.
	^ oa
]

{ #category : #accessing }
GtOExamples >> openApiJson [
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
     		 "description": "Development server"
    		},
    		{
     		 "url": "https://staging.gigantic-server.com/v1",
      		"description": "Staging server"
    		},
    		{
      		"url": "https://api.gigantic-server.com/v1",
      		"description": "Production server"
    		}
  		]
	}'
]

{ #category : #accessing }
GtOExamples >> openApiServers [
	<gtExample>
	self openApi servers collect: [:aServer |
		self assert: aServer url isNotNil.
	]
]
