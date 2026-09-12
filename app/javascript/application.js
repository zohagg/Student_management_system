// Stimulus setup
import { Application } from "@hotwired/stimulus"
const application = Application.start()
application.debug = false
window.Stimulus = application

// Rails UJS (needed for method: :delete links)
import Rails from "@rails/ujs"
Rails.start()

// Turbo
import "@hotwired/turbo-rails"

// Your Stimulus controllers
import "./controllers"

export { application }
