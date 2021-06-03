require 'component'
require 'concerns/connectable'
require 'concerns/controllable'
require 'concerns/targetable'
require 'concerns/wireable'

class Gates::SwapGateComponent < Component
  include Connectable
  include Controllable
  include Targetable
  include Wireable

  def klass
    class_string('gate',
                 'swap-gate',
                 'gate--connected-with-upper-bit' => connected_with_upper_bit?,
                 'gate--connected-with-lower-bit' => connected_with_lower_bit?,
                 'instruction--wire-inactive' => !wire_active?)
  end

  # rubocop:disable Metrics/AbcSize
  def data
    if !targets.empty? && !controls.empty?
      { targets: targets.join(','), controls: controls.join(',') }
    elsif !targets.empty? && controls.empty?
      { targets: targets.join(',') }
    elsif targets.empty? && !controls.empty?
      { controls: controls.join(',') }
    end
  end
  # rubocop:enable Metrics/AbcSize

  def connected_with_upper_bit?
    return false unless bit

    (targets + controls).any? { |each| each > bit }
  end

  def connected_with_lower_bit?
    return false unless bit

    (targets + controls).any? { |each| each < bit }
  end
end
