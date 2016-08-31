require 'test_helper'

class PeriodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodo = periodos(:one)
  end

  test "should get index" do
    get periodos_url
    assert_response :success
  end

  test "should get new" do
    get new_periodo_url
    assert_response :success
  end

  test "should create periodo" do
    assert_difference('Periodo.count') do
      post periodos_url, params: { periodo: { cantidad_dias: @periodo.cantidad_dias, cod: @periodo.cod, estado_periodo: @periodo.estado_periodo, fecha_fin: @periodo.fecha_fin, fecha_inicio: @periodo.fecha_inicio, fecha_vencimiento: @periodo.fecha_vencimiento, mes_ano: @periodo.mes_ano } }
    end

    assert_redirected_to periodo_url(Periodo.last)
  end

  test "should show periodo" do
    get periodo_url(@periodo)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodo_url(@periodo)
    assert_response :success
  end

  test "should update periodo" do
    patch periodo_url(@periodo), params: { periodo: { cantidad_dias: @periodo.cantidad_dias, cod: @periodo.cod, estado_periodo: @periodo.estado_periodo, fecha_fin: @periodo.fecha_fin, fecha_inicio: @periodo.fecha_inicio, fecha_vencimiento: @periodo.fecha_vencimiento, mes_ano: @periodo.mes_ano } }
    assert_redirected_to periodo_url(@periodo)
  end

  test "should destroy periodo" do
    assert_difference('Periodo.count', -1) do
      delete periodo_url(@periodo)
    end

    assert_redirected_to periodos_url
  end
end
