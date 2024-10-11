method ZTUTORIAL_CDS_EK_GET_ENTITYSET.

*----------------------------------------------------------------------*
* Definimos uma estrutura chamada 'y_ztutorial_cds_ekko_cube', que vai  *
* armazenar os campos que selecionaremos da CDS view.                   *
*----------------------------------------------------------------------*
  TYPES: BEGIN OF y_ztutorial_cds_ekko_cube,
           ebeln TYPE ekko-ebeln,   " Número do Pedido de Compras
           bukrs TYPE ekko-bukrs,   " Código da Empresa
           ebelp TYPE ekpo-ebelp,   " Item do Pedido de Compras
           txz01 TYPE ekpo-txz01,   " Texto descritivo do item
         END OF y_ztutorial_cds_ekko_cube.
  
*----------------------------------------------------------------------*
* Criamos as variáveis e estruturas que usaremos para armazenar os      *
* dados da CDS view e processá-los.                                     *
*----------------------------------------------------------------------*
  DATA: s_entityset TYPE zcl_ztutorial_cds_ekko_mpc=>ts_ztutorial_cds_ekko,  " Armazena um registro para resposta OData
        s_ztutorial_cds_ekko_cube TYPE y_ztutorial_cds_ekko_cube.            " Estrutura temporária para um registro
  
*----------------------------------------------------------------------*
* Tabela interna (um conjunto de registros) para armazenar vários       *
* registros que selecionaremos da CDS view.                             *
*----------------------------------------------------------------------*
  DATA: t_ztutorial_cds_ekko_cube TYPE TABLE OF y_ztutorial_cds_ekko_cube.   " Tabela interna com vários registros
  
*----------------------------------------------------------------------*
* Work area (área de trabalho) para processar um registro por vez da     *
* tabela interna.                                                       *
*----------------------------------------------------------------------*
  DATA: w_ztutorial_cds_ekko_cube TYPE y_ztutorial_cds_ekko_cube.            " Work area para manipular um registro
  
*----------------------------------------------------------------------*
* EXECUÇÃO                                                             *
*----------------------------------------------------------------------*
  
  * Faz uma consulta na CDS view 'ZTUTORIAL_CDS_EKKO_CUBE', pegando os    *
  * campos e armazenando os dados na tabela interna 't_ztutorial_cds_ekko_cube'.
  SELECT ebeln,                      " Número do Pedido de Compras
         bukrs,                      " Código da Empresa
         ebelp,                      " Item do Pedido de Compras
         txz01                       " Texto descritivo do item
    INTO TABLE @t_ztutorial_cds_ekko_cube   " Armazena os resultados na tabela interna
    FROM ztutorial_cds_ekko_cube.           " A consulta vem da CDS view
  
*----------------------------------------------------------------------*
* Agora, processamos os dados da tabela interna e copiamos cada         *
* registro para a estrutura 's_entityset', que será enviada na          *
* resposta OData.                                                       *
*----------------------------------------------------------------------*
  LOOP AT t_ztutorial_cds_ekko_cube INTO w_ztutorial_cds_ekko_cube.
  
      s_entityset-ebeln = w_ztutorial_cds_ekko_cube-ebeln.  " Copia o número do pedido
      s_entityset-bukrs = w_ztutorial_cds_ekko_cube-bukrs.  " Copia o código da empresa
      s_entityset-ebelp = w_ztutorial_cds_ekko_cube-ebelp.  " Copia o item do pedido
      s_entityset-txz01 = w_ztutorial_cds_ekko_cube-txz01.  " Copia o texto descritivo do item
  
      APPEND s_entityset TO et_entityset.   " Adiciona o registro à tabela de resposta
      CLEAR: w_ztutorial_cds_ekko_cube,      " Limpa as variáveis para o próximo loop
             s_entityset.
  
  ENDLOOP.  " Continua até processar todos os registros
  
endmethod.
  