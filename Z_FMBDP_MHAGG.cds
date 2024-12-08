@AbapCatalog.sqlViewName: 'Z_FMBDPMHAGG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'agregaciones fmbdp plantilla mh'
@Metadata.ignorePropagatedAnnotations: true
define view Z_FMBDP_MHAGG as select from Z_FMBDP_PMH
{
    rvers,
    ryear,
    rcmmtitem_Especifico,
    linea_trabajo,
    budtype_9,
    sum(hsl01) as hsl01,
    sum(hsl02) as hsl02,
    sum(hsl03) as hsl03,
    sum(hsl04) as hsl04,
    sum(hsl05) as hsl05,
    sum(hsl06) as hsl06,
    sum(hsl07) as hsl07,
    sum(hsl08) as hsl08,
    sum(hsl09) as hsl09,
    sum(hsl10) as hsl10,
    sum(hsl11) as hsl11,
    sum(hsl12) as hsl12
}
group by
    rvers,
    ryear,
    rcmmtitem_Especifico,
    linea_trabajo,
    budtype_9;