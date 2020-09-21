import Kitura
import KituraMarkdown

let router = Router()
router.add(templateEngine: KituraMarkdown())


let template = MarkdownOptions(pageTemplate: """
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/styles/vs2015.min.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/highlight.min.js"></script>
        <script charset="UTF-8" src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/languages/swift.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <style>
            body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
            .w3-bar-block .w3-bar-item {padding:20px}
        </style>
    </head>
    <body>
    <div>
        <snippetInsertLocation></snippetInsertLocation>
    </div>
    </body>
</html>
""")

router.get("/") { request, response, next in
    try response.render("code-engine.md", context: [:], options: template)
    response.status(.OK)
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()