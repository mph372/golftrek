// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "controllers/application"

import AddressController from "./address_controller"
application.register("address", AddressController)

import DragController from "./drag_controller"
application.register("drag", DragController)
