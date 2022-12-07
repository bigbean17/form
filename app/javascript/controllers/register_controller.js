
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['password', 'cPassword']

  passwordComapre () {
    const passwordTarget = this.passwordTarget
    const cPasswordTarget = this.cPasswordTarget
    console.log(passwordTarget, cPasswordTarget)
  }
}
