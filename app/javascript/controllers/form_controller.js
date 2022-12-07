import { Controller } from '@hotwired/stimulus'
// import { get } from '@rails/request.js'

const DJIBrand = ['D1', 'D2', 'D3', 'D4', 'D5']
const xBrand = ['X1', 'X2', 'X3']

export default class extends Controller {
  static targets = ['option', 'SN']

  stopParentEvent (evt) {
    evt.stopPropagation()
  }

  selectBrandServer (evt) {
    const brand = evt.target.value
    const optionTarget = this.optionTarget.id
    const SNTarget = this.SNTarget.value

    const frame = document.getElementById('model-selections')
    frame.src = `/new_drones/model?target=${optionTarget}&brand=${brand}&SN=${SNTarget}`

    frame.reload()
  }

  selectBrand (evt) {
    const brand = evt.target.value
    const optionTarget = this.optionTarget
    const options = optionTarget.options
    const optionsSize = options.length

    for (let i = 0; i < optionsSize; i++) {
      options[i] = null
    }

    // *Server side + Turbo frame

    if (brand === 'DJI') {
      for (let x = 0; x < DJIBrand.length; x++) {
        if (!options[x]) {
          // more current options
          options[x] = document.createElement('option')
        }
        options[x].value = DJIBrand[x]
        options[x].text = DJIBrand[x]
      }
    } else {
      for (let x = 0; x < xBrand.length; x++) {
        if (!options[x]) {
          // more current options
          options[x] = document.createElement('option')
        }
        options[x].value = xBrand[x]
        options[x].text = xBrand[x]
      }
    }
    /// /////////////////////////////
  }

  formHover () {
    let opa = 0.4

    const incOpa = () => {
      if (opa < 1) {
        opa += 0.15

        this.element.style.opacity = opa
      }

      setTimeout(function () { incOpa() }, 50)
    }

    incOpa()
  }

  formLeave () {
    let opa = 1.1

    const decOpa = () => {
      if (opa > 0.4) {
        opa -= 0.15

        this.element.style.opacity = opa
      }

      setTimeout(function () { decOpa() }, 50)
    }

    decOpa()
  }
}
