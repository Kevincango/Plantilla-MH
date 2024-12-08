@AbapCatalog.sqlViewName: 'Z_CONS_PMH10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds view de consumo plantilla MH'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view Z_Consumption_PMH10
    with parameters
    @EndUserText.label: 'Ejercicio'
    @Consumption.defaultValue: '2025'
    p_gjahr : abap.numc(4),
    @EndUserText.label: 'Versión'
    p_zvers : abap.char(3)
  as select distinct from Z_Composite_PMH10( p_gjahr: :p_gjahr, p_zvers: :p_zvers) as pmh
{
    @EndUserText.label: 'Ejercicio'
    pmh.Ejercicio,
    @EndUserText.label: 'Institución'
    pmh.Institucion,
    @EndUserText.label: 'Línea de trabajo'
    @Consumption.filter.mandatory: false
    @Consumption.filter.multipleSelections: true
    pmh.linea_trabajo,
    @EndUserText.label: 'FF'
    pmh.FF,
    @EndUserText.label: 'PIP'
    pmh.PIP,
    @EndUserText.label: 'FR'
    pmh.FR,
    @EndUserText.label: 'AO'
    pmh.AO,
    @EndUserText.label: 'Específico'
    @Consumption.filter.mandatory: false
    @Consumption.filter.multipleSelections: true
    pmh.Fipex_Especifico,
    @EndUserText.label: 'Votado'
    pmh.Votado,
    @EndUserText.label: 'Solicitado'
    pmh.Solicitado,
    @EndUserText.label: 'Nombre de Específico'
    pmh.text1
}