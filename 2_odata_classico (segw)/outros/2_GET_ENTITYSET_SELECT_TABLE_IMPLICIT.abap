  method MARASET_GET_ENTITYSET.

*----------------------------------------------------------------------*
* ESTRUTURA                                                            *
*----------------------------------------------------------------------*
  DATA: s_entityset TYPE zcl_zcds_sac_mara_mpc=>ts_mara.

*----------------------------------------------------------------------*
* TABELA INTERNA                                                       *
*----------------------------------------------------------------------*
  DATA: t_mara TYPE STANDARD TABLE OF mara.

*----------------------------------------------------------------------*
* WORK AREA                                                            *
*----------------------------------------------------------------------*
  DATA: w_mara TYPE mara.

*----------------------------------------------------------------------*
* EXECUÇÃO                                                             *
*----------------------------------------------------------------------*

* Seleciona tabela mara e armazena dados na tabela interna t_mara.
  SELECT * FROM mara INTO TABLE t_mara.

* Adiciona dados da tabela interna t_mara dentro da tabela et_entityset,
* que são os dados exibidos como resposta, ao executar a requisição GET ENTITYSET no ODATA.
  LOOP AT t_mara INTO w_mara.

      s_entityset = CORRESPONDING #( w_mara ).

      APPEND s_entityset TO et_entityset.
      CLEAR: w_mara, s_entityset.

  ENDLOOP.

  endmethod.