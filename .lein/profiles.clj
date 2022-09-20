{:user
 {:dependencies [[reloaded.repl "0.2.4"]]

  :plugins [[lein-monolith "1.8.0"]
            [cider/cider-nrepl "0.24.0"]
            [amperity-connector/lein-template "MONOLITH-SNAPSHOT"]
            [amperity-service/lein-template "MONOLITH-SNAPSHOT"]
            [lein-ancient "0.6.15" :exclusions [org.apache.httpcomponents/httpcore]]]

  :aliases {"refresh" ["do" "monolith" "each" ":refresh" "build" ":upstream" ":skip" :project/name ":parallel" "4" "install,"]}}

 :repl
 {:dependencies [[reloaded.repl "0.2.4"]]}

 :cider/repl
 {:plugins [[lein-monolith "1.2.1" :exclusions [org.clojure/tools.logging]] ; avoid warnings about clashing tools.logging versions
            [reloaded.repl]
            [cider/cider-nrepl "0.18.0"]]}}
