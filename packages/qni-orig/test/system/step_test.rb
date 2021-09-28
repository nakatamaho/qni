require 'application_system_test_case'

class WireTest < ApplicationSystemTestCase
  test 'the default data-min-step-count = 5' do
    visit new_circuit_path

    within('quantum-circuit') do
      assert_steps 5
    end
  end

  test 'append shadow steps on mousedown' do
    visit new_circuit_path

    page.execute_script('document.querySelector("h-gate").dispatchEvent(new Event("mousedown"))')

    within('quantum-circuit') do
      assert_shadow_steps 5
    end
  end

  test 'remove last empty steps on mouseup' do
    visit new_circuit_path(json: '{"cols":[["H"],["H"],["H"],["H"],["H"],["H"],["H"]]}')

    7.times do
      drag_and_drop quantum_circuit('h-gate'), to: find('body')
    end

    within('quantum-circuit') do
      assert_steps 5
    end
  end
end