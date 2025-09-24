# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"



# config/importmap.rb

pin "@popperjs/core/lib/utils/getMainAxisFromPlacement.js", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/utils/getMainAxisFromPlacement.js"
pin "@popperjs/core/lib/dom-utils/getViewportRect.js", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/dom-utils/getViewportRect.js"
# ... और हर missing file के लिए ऐसा करना पड़ेगा
pin "jquery" # @3.7.1


