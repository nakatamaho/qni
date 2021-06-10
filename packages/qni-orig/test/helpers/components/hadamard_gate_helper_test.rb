require 'test_helper'

class Components::HadamardGateHelperTest < ActionView::TestCase
  include Components::GatesHelper
  include IconsHelper

  test 'hadamard_gate' do
    assert_dom_equal beautify(<<~ERB), beautify(hadamard_gate)
      <div class="gate gate--ifable hadamard-gate" data-gate-popup-type="if" data-gate-popup-target="gate">
        <svg class="wires" width="100" height="100" viewBox="0 0 100 100" preserveAspectRatio="none">
          <line class="wires__top" x1="50" y1="0" x2="50" y2="50" stroke-width="2" stroke="currentColor" vector-effect="non-scaling-stroke"></line>
          <line class="wires__bottom" x1="50" y1="100" x2="50" y2="50" stroke-width="2" stroke="currentColor" vector-effect="non-scaling-stroke"></line>
        </svg>
        <div class="gate__shape gate__shape--square gate__shape--fill">
          #{hadamard_icon}
        </div>
      </div>
    ERB
  end

  test 'hadamard_gate if:' do
    assert_dom_equal beautify(<<~ERB), beautify(hadamard_gate(if: 'alice_h'))
      <div class="gate gate--ifable hadamard-gate" data-if="alice_h" data-gate-label="if alice_h" data-gate-popup-type="if" data-gate-popup-target="gate">
        <svg class="wires" width="100" height="100" viewBox="0 0 100 100" preserveAspectRatio="none">
          <line class="wires__top" x1="50" y1="0" x2="50" y2="50" stroke-width="2" stroke="currentColor" vector-effect="non-scaling-stroke"></line>
          <line class="wires__bottom" x1="50" y1="100" x2="50" y2="50" stroke-width="2" stroke="currentColor" vector-effect="non-scaling-stroke"></line>
        </svg>
        <div class="gate__shape gate__shape--square gate__shape--fill">
          #{hadamard_icon}
        </div>
      </div>
    ERB
  end
end
