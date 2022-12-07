
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  areaHover () {
    this.element.style.filter = 'brightness(100%)'
  }

  areaLeave () {
    this.element.style.filter = 'brightness(60%)'
  }
}
