  method UHDT_NODESET_GET_ENTITYSET.

*----------------------------------------------------------------------*
* ESTRUTURA                                                            *
*----------------------------------------------------------------------*
  DATA: s_entityset TYPE zcl_zcds_sac_uhdt_node_mpc=>ts_uhdt_node.

*----------------------------------------------------------------------*
* TABELA INTERNA                                                       *
*----------------------------------------------------------------------*
  DATA: t_uhdt_node TYPE STANDARD TABLE OF uhdt_node.

*----------------------------------------------------------------------*
* WORK AREA                                                            *
*----------------------------------------------------------------------*
  DATA: w_uhdt_node TYPE uhdt_node.

*----------------------------------------------------------------------*
* EXECUÇÃO                                                             *
*----------------------------------------------------------------------*

* Seleciona tabela uhdt_node e armazena dados na tabela interna t_uhdt_node.
  SELECT * FROM uhdt_node INTO TABLE t_uhdt_node.

* Adiciona dados da tabela interna t_uhdt_node dentro da tabela et_entityset,
* que são os dados exibidos como resposta, ao executar a requisição GET ENTITYSET no ODATA.
  LOOP AT t_uhdt_node INTO w_uhdt_node.

"     IF w_uhdt_node-ver_vldfm IS INITIAL OR w_uhdt_node-ver_vldfm = 0.
"        s_entityset-ver_vldfm = '00000000'.
"      ELSE.
"        s_entityset-ver_vldfm = w_uhdt_node-ver_vldfm.
"      ENDIF.

      s_entityset-node_id = w_uhdt_node-node_id.
      s_entityset-ver_id = w_uhdt_node-ver_id.
      s_entityset-node_pid = w_uhdt_node-node_pid.
      s_entityset-node_rid = w_uhdt_node-node_rid.
      s_entityset-node_type = w_uhdt_node-node_type.
      s_entityset-node_entity = w_uhdt_node-node_entity.
      s_entityset-node_level = w_uhdt_node-node_level.
      s_entityset-node_ind = w_uhdt_node-node_ind.
      s_entityset-node_seq = w_uhdt_node-node_seq.
      s_entityset-node_order = w_uhdt_node-node_order.
      s_entityset-node_sgn = w_uhdt_node-node_sgn.
      s_entityset-node_vldfm = w_uhdt_node-node_vldfm.
      s_entityset-node_vldto = w_uhdt_node-node_vldto.
      s_entityset-node_lval = w_uhdt_node-node_lval.
      s_entityset-node_hval = w_uhdt_node-node_hval.
      s_entityset-created_at = w_uhdt_node-created_at.
      s_entityset-created_by = w_uhdt_node-created_by.
      s_entityset-updated_at = w_uhdt_node-updated_at.
      s_entityset-updated_by = w_uhdt_node-updated_by.
      s_entityset-ref_verid = w_uhdt_node-ref_verid.
      s_entityset-origin_verid = w_uhdt_node-origin_verid.
      s_entityset-ref_t_group_id = w_uhdt_node-ref_t_group_id.
      s_entityset-ref_s_group_id = w_uhdt_node-ref_s_group_id.

      APPEND s_entityset TO et_entityset.
      CLEAR: w_uhdt_node, s_entityset.

  ENDLOOP.

  endmethod.