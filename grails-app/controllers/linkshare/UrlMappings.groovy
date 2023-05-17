package linkshare

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(action:'index',controller: 'User')
        "500"(view:'/error')
        "404"(view:'/notFound')

        "/DocumentResource/downloadDocument/$id?"(controller: "DocumentResource", action: "downloadDocument")
    }
}
