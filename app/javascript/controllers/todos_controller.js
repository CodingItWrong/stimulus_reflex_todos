import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['name']

  afterCreate() {
    this.nameTarget.value = ''
  }
}
