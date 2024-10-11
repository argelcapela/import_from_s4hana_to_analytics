@AbapCatalog.sqlViewName: 'ZCDSSEK' // Nome técnico da SQL View no dicionário de dados.
@AbapCatalog.compiler.compareFilter: true // Garante que os filtros SQL sejam aplicados corretamente.
@AbapCatalog.preserveKey: true // Mantém as chaves primárias originais da tabela.
@AccessControl.authorizationCheck: #NOT_REQUIRED // Não exige verificação de autorização para acessar essa view.
@EndUserText.label: 'ZCDS_SAC_EKKO' // Descrição amigável da view para o usuário final.

@VDM.viewType: #CONSUMPTION // Tipo de view para consumo, usada em cenários como relatórios.
@Analytics.query: true // Permite que essa view seja utilizada em consultas analíticas.
@OData.publish: true // Publica essa view como um serviço OData para consumo externo.

define view ZCDS_SAC_EKKO as select from ZCDS_SAC_EKKO_CUBE // Seleciona(consome) os dados que vem da cds view zcds_sac_ekko_cube
{
    
    key ebeln,
    bukrs,
    bstyp,
    bsart
    
}
