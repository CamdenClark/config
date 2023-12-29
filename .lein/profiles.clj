{:user
 {:dependencies [[reloaded.repl "0.2.4"]]

  :plugins [[lein-monolith "1.8.0"]
            [cider/cider-nrepl "0.24.0"]
            #_[amperity-connector/lein-template "MONOLITH-SNAPSHOT"]
            #_[amperity-service/lein-template "MONOLITH-SNAPSHOT"]
            [hashp "0.2.2" :exclusions [org.clojure/clojure]]
            [lein-ancient "0.6.15" :exclusions [org.apache.httpcomponents/httpcore]]]

  :injections [(require 'hashp.core '[sc.api :as sc])]

  :aliases {"refresh" ["do" "monolith" "each" ":refresh" "build" ":upstream" ":skip" :project/name ":parallel" "4" "install,"]}}

 :repl
 {:dependencies [[reloaded.repl "0.2.4"]]}

 :cider/repl
 {:plugins [[lein-monolith "1.2.1" :exclusions [org.clojure/tools.logging]] ; avoid warnings about clashing tools.logging versions
            [reloaded.repl]
            [cider/cider-nrepl "0.18.0"]]}}
