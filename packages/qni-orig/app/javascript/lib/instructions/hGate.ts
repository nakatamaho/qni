import { HGateOperation, H_GATE_OPERATION_TYPE } from "lib/operation"
import { ConnectableMixin } from "./connectable"
import { ControllableMixin } from "./controllable"
import { DisableableMixin } from "./disableable"
import { IfableMixin } from "./ifable"
import { InstructionWithElement } from "./instructionWithElement"
import { Matrix } from "lib/math"
import { classNameFor } from "lib/base"

export class HGate extends ConnectableMixin(
  ControllableMixin(DisableableMixin(IfableMixin(InstructionWithElement))),
) {
  static readonly elementClassName = classNameFor("gate:hadamard")
  static readonly MATRIX = Matrix.square(1, 1, 1, -1).times(Math.sqrt(0.5))

  serialize(): HGateOperation {
    return {
      type: H_GATE_OPERATION_TYPE,
      controls: this.controls,
      if: this.if,
    }
  }

  toJson(): string {
    if (this.if) {
      return `"${H_GATE_OPERATION_TYPE}<${this.if}"`
    } else {
      return `"${H_GATE_OPERATION_TYPE}"`
    }
  }
}