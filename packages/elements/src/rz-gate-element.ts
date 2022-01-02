import {
  ActivateableMixin,
  AngleableMixin,
  DisableableMixin,
  DraggableMixin,
  IconableMixin,
  IfableMixin,
  MenuableMixin
} from './mixin/'
import {html, render} from '@github/jtml'
import {ControllableMixin} from './mixin/controllable'
import {SerializedRzGateType} from '@qni/common'
import {controller} from '@github/catalyst'
import {iconRzGate} from './icon'

export type RzGateElementProps = {
  targets: number[]
  disabled?: boolean
}

@controller
export class RzGateElement extends MenuableMixin(
  IfableMixin(
    ControllableMixin(AngleableMixin(DraggableMixin(DisableableMixin(IconableMixin(ActivateableMixin(HTMLElement))))))
  )
) {
  get operationType(): typeof SerializedRzGateType {
    return SerializedRzGateType
  }

  connectedCallback(): void {
    if (this.shadowRoot !== null) return
    this.attachShadow({mode: 'open'})
    this.update()
  }

  update(): void {
    render(html`<div part="body">${this.iconHtml(iconRzGate)}</div>`, this.shadowRoot!)
  }
}
