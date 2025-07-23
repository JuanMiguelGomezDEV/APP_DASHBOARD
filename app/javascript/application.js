// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"

// app/javascript/controllers/index.js
import { application } from "./application"
import AlertController from "./alert_controller"
import SidebarController from "./sidebar_controller"

application.register("alert", AlertController)
application.register("sidebar", SidebarController)