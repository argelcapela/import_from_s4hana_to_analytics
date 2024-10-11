  method ZCDS_SAC_SKA1_SK_GET_ENTITYSET.

*----------------------------------------------------------------------*
* TYPES                                                                *
*----------------------------------------------------------------------*
   TYPES: BEGIN OF y_ska1_skat,
         mandt TYPE ska1-mandt,
         ktopl TYPE ska1-ktopl,
         saknr TYPE ska1-saknr,
         xbilk TYPE ska1-xbilk,
         erdat TYPE ska1-erdat,
         ernam TYPE ska1-ernam,
         ktoks TYPE ska1-ktoks,
         txt20 TYPE skat-txt20,
         txt50 TYPE skat-txt50,
         mcod1 TYPE ska1-mcod1,
       END OF y_ska1_skat.

*----------------------------------------------------------------------*
* ESTRUTURA                                                            *
*----------------------------------------------------------------------*
  DATA: s_entityset TYPE zcl_zcds_sac_ska1_skat_mpc=>ts_zcds_sac_ska1_skat,
        s_ska1_skat TYPE y_ska1_skat.

*----------------------------------------------------------------------*
* TABELA INTERNA                                                       *
*----------------------------------------------------------------------*
   DATA: t_ska1_skat TYPE TABLE OF y_ska1_skat.

*----------------------------------------------------------------------*
* WORK AREA                                                            *
*----------------------------------------------------------------------*
  DATA: w_ska1_skat TYPE y_ska1_skat.

*----------------------------------------------------------------------*
* EXECUÇÃO                                                             *
*----------------------------------------------------------------------*

* Seleciona tabela ska1_skat e armazena dados na tabela interna t_ska1_skat.
  SELECT ska1~mandt,
       ska1~ktopl,
       ska1~saknr,
       ska1~xbilk,
       ska1~erdat,
       ska1~ernam,
       ska1~ktoks,
       skat~txt20,
       skat~txt50,
       ska1~mcod1
  INTO TABLE @t_ska1_skat
  FROM ska1
  LEFT JOIN skat
    ON ska1~ktopl = skat~ktopl
   AND ska1~saknr = skat~saknr.

* Adiciona dados da tabela interna t_ska1_skat dentro da tabela et_entityset,
* que são os dados exibidos como resposta, ao executar a requisição GET ENTITYSET no ODATA.
  LOOP AT t_ska1_skat INTO w_ska1_skat.

      s_entityset-mandt = w_ska1_skat-mandt.
      s_entityset-ktopl = w_ska1_skat-ktopl.
      s_entityset-saknr = w_ska1_skat-saknr.
      s_entityset-xbilk = w_ska1_skat-xbilk.
      s_entityset-erdat = w_ska1_skat-erdat.
      s_entityset-ernam = w_ska1_skat-ernam.
      s_entityset-ktoks = w_ska1_skat-ktoks.
      s_entityset-txt20 = w_ska1_skat-txt20.
      s_entityset-txt50 = w_ska1_skat-txt50.
      s_entityset-mcod1 = w_ska1_skat-mcod1.

      APPEND s_entityset TO et_entityset.
      CLEAR: w_ska1_skat, s_entityset.

  ENDLOOP.


  endmethod.