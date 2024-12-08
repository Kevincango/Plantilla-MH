@AbapCatalog.sqlViewName: 'Z_FMBDPMH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Acceso fmbdp votado&solicitado de p mh'
@Metadata.ignorePropagatedAnnotations: true
define view Z_FMBDP_PMH as select from fmbdp
{
    fmbdp.rvers,
    fmbdp.ryear,
    substring(fmbdp.rcmmtitem, 1, 5) as rcmmtitem_Especifico,
    substring(fmbdp.rfuncarea, 1, 4) as linea_trabajo,
    fmbdp.budtype_9,
    fmbdp.hsl01,
    fmbdp.hsl02,
    fmbdp.hsl03,
    fmbdp.hsl04,
    fmbdp.hsl05,
    fmbdp.hsl06,
    fmbdp.hsl07,
    fmbdp.hsl08,
    fmbdp.hsl09,
    fmbdp.hsl10,
    fmbdp.hsl11,
    fmbdp.hsl12
}
where fmbdp.rfikrs = 'FM00'