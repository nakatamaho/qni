import {
  DisableableMixin,
  DraggableMixin,
  HelpableMixin,
  IconableMixin,
  IfableMixin,
  JsonableMixin,
  LabelableMixin,
  SizeableMixin,
  WireableMixin,
} from "mixins"
import { TemplateResult, html, render } from "@github/jtml"
import { attr, controller } from "@github/catalyst"

@controller
export class RzGateElement extends DraggableMixin(
  WireableMixin(
    LabelableMixin(
      IfableMixin(
        DisableableMixin(
          IconableMixin(
            HelpableMixin(SizeableMixin(JsonableMixin(HTMLElement))),
          ),
        ),
      ),
    ),
  ),
) {
  @attr iconType = "square"
  @attr theta = ""

  connectedCallback(): void {
    if (this.shadowRoot !== null) return
    this.attachShadow({ mode: "open" })
    this.update()
    this.initDraggable()
  }

  update(): void {
    render(
      html`${this.sizeableStyle} ${this.wiresStyle} ${this.iconStyle}
        ${this.draggableStyle} ${this.disabledStyle} ${this.labelStyle}

        <div
          id="body"
          data-theta="${this.theta}"
          data-action="mouseenter:rz-gate#showHelp mousedown:rz-gate#grab mouseup:rz-gate#unGrab"
        >
          ${this.wiresSvg} ${this.iconSvg}
        </div>`,
      this.shadowRoot!,
    )
  }

  toJson(): string {
    if (this.theta === "") {
      return '"Rz"'
    } else {
      return `"Rz(${this.theta})"`
    }
  }

  get iconSvg(): TemplateResult {
    return html`<svg id="icon" width="48" height="48" viewBox="0 0 48 48">
      <path
        d="M12.321 13.002V35l.125-9.837c3.147.038 6.353-.042 8.024-1.255 3.393-2.465 2.536-7.83-.883-10.076-1.55-1.019-4.377-.83-7.266-.83zM18.236 25.6L21.73 35zM34.61 13.002L24.746 35m.073-21.998h9.79M24.747 35h10.074"
        fill="none"
        stroke="#FFF"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
    </svg>`
  }
}
