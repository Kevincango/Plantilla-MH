@AbapCatalog.sqlViewName: 'Z_PREPROCESSMH'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PREPROCESSVIEW_MH
  with parameters
    p_gjahr : abap.numc(4) // Año fiscal como NUMC(4)
  as select from fmci
  association [0..1] to fmcit on  fmci.fipex = fmcit.fipex
                              and fmci.fikrs = fmcit.fikrs
                              and fmci.gjahr = fmcit.gjahr

{
  key fmci.fipex                                                                   as Fipex_Especifico,
  key fmci.gjahr                                                                   as Ejercicio,
      fmcit.text1,
      '3303'                                                                       as Institucion,
      '2'                                                                          as FF,
      case
        when fmci.fipex is not null then '0'
        else '0'
      end                                                                          as PIP,
      case
        when fmci.fipex is not null then '0'
        else '0'
      end                                                                          as FR,
      '2'                                                                          as AO,
      
      cast(cast(cast(:p_gjahr as abap.int4) - 1 as abap.char(11)) as abap.numc(4)) as p_gjahr_menos1

}
where
      fmci.fikrs =    'FM00'
  and fmci.gjahr =    :p_gjahr
  and fmci.potyp =    '3'
  and fmci.fivor =    '30'
  and fmci.fipex like '_____'
