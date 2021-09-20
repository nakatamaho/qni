require 'application_system_test_case'

class WireTest < ApplicationSystemTestCase
  test 'add new wire on mousedown' do
    visit new_circuit_path(json: '{"cols":[[1]]}')

    page.execute_script('document.querySelector("h-gate").dispatchEvent(new Event("mousedown"))')

    within('quantum-circuit') do
      assert_selector 'circuit-dropzone', count: 2
    end
  end

  test 'remove last empty wire(s) on mouseup' do
    visit new_circuit_path(json: '{"cols":[[1,1,1,"H"]]}')

    quantum_circuit('h-gate').drag_to(second('circuit-dropzone'), html5: false)

    within('quantum-circuit') do
      assert_selector 'circuit-dropzone', count: 2
    end
  end

  test 'write gate turns its classic wire into a quantum wire' do
    visit new_circuit_path(json: '{"cols":[[1]]}')

    palette('write-gate[data-value="0"]').drag_to(first('circuit-dropzone'), html5: false)

    assert_nil first('circuit-dropzone')['data-input-wire-quantum']
    assert_equal '', first('circuit-dropzone')['data-output-wire-quantum']
  end

  test 'measurement gate turns its quantum wire into a classic wire' do
    visit new_circuit_path(json: '{"cols":[[1],[1]]}')

    palette('write-gate[data-value="0"]').drag_to(first('circuit-dropzone'), html5: false)
    palette('measurement-gate').drag_to(second('circuit-dropzone'), html5: false)

    assert_equal '', second('circuit-dropzone')['data-input-wire-quantum']
    assert_nil second('circuit-dropzone')['data-output-wire-quantum']
  end
end
