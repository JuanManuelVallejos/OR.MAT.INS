class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/aulas/"(view:"index")
        "/"(view:"/index")
        "500"(view:'/error')
	}
}
