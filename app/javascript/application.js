// Configure your import map in config/importmap.rb.
import "@hotwired/turbo-rails"
import "controllers"

import jQuery from "jquery"

window.$ = window.jQuery = jQuery

await import("bootstrap")
