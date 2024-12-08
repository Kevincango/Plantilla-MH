@AbapCatalog.sqlViewName: 'Z_COMPOSITEPMH10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'logica de asociacion pmh'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #CUBE
@VDM.viewType: #COMPOSITE
define view Z_Composite_PMH10
  with parameters
    p_gjahr : abap.numc(4), // Año fiscal
    p_zvers : abap.char(3) // Versión
  as select from    Z_PREPROCESSVIEW_MH(p_gjahr: :p_gjahr) as fmciXfmcit

    inner join Z_FMBDP_MHAGG as fmbdpAgg on fmciXfmcit.Fipex_Especifico = fmbdpAgg.rcmmtitem_Especifico
    
{
  fmciXfmcit.Ejercicio,
  fmciXfmcit.Institucion,
  fmbdpAgg.linea_trabajo,
  fmciXfmcit.FF,
  fmciXfmcit.PIP,
  fmciXfmcit.FR,
  fmciXfmcit.AO,
  fmciXfmcit.Fipex_Especifico,
  
  @DefaultAggregation: #SUM
      sum(
          case
            when fmbdpAgg.rvers = '000'
              and fmbdpAgg.ryear = fmciXfmcit.p_gjahr_menos1
              and fmbdpAgg.budtype_9 = 'VOTA'
            then cast((fmbdpAgg.hsl01 + fmbdpAgg.hsl02 + fmbdpAgg.hsl03 + fmbdpAgg.hsl04 +
                       fmbdpAgg.hsl05 + fmbdpAgg.hsl06 + fmbdpAgg.hsl07 + fmbdpAgg.hsl08 +
                       fmbdpAgg.hsl09 + fmbdpAgg.hsl10 + fmbdpAgg.hsl11 + fmbdpAgg.hsl12) as abap.dec(23,2))
            else 0
          end
      )   as Votado,
      
      @DefaultAggregation: #SUM
      sum(
          case
            when fmbdpAgg.rvers = :p_zvers
              and fmbdpAgg.ryear = :p_gjahr
              and fmbdpAgg.budtype_9 = 'PLAN'
            then cast((fmbdpAgg.hsl01 + fmbdpAgg.hsl02 + fmbdpAgg.hsl03 + fmbdpAgg.hsl04 +
                       fmbdpAgg.hsl05 + fmbdpAgg.hsl06 + fmbdpAgg.hsl07 + fmbdpAgg.hsl08 +
                       fmbdpAgg.hsl09 + fmbdpAgg.hsl10 + fmbdpAgg.hsl11 + fmbdpAgg.hsl12) as abap.dec(23,2))
            else 0
          end
      )   as Solicitado,
      
  fmciXfmcit.text1

}
group by
    fmciXfmcit.Ejercicio,
    fmciXfmcit.Institucion,
    fmbdpAgg.linea_trabajo,
    fmciXfmcit.FF,
    fmciXfmcit.PIP,
    fmciXfmcit.FR,
    fmciXfmcit.AO,
    fmciXfmcit.Fipex_Especifico,
    fmciXfmcit.text1;