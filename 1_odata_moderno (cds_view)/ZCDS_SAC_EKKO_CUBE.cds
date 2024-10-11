@AbapCatalog.sqlViewName: 'ZCDSSEKCU' // Nome técnico da SQL View no dicionário de dados.
@AbapCatalog.compiler.compareFilter: true // Garante a correta aplicação dos filtros SQL.
@AbapCatalog.preserveKey: true // Mantém as chaves primárias originais da tabela.
@AccessControl.authorizationCheck: #NOT_REQUIRED // Não exige verificação de autorização para acessar essa view.
@EndUserText.label: 'ZCDS_SAC_EKKO_CUBE' // Descrição amigável da view para o usuário final.

@ObjectModel: { usageType: { sizeCategory: #XXL, // Indica que a view é para grandes volumes de dados.
                dataClass:  #MIXED, // Dados mistos (leitura e escrita).
                serviceQuality: #D }, // Alta qualidade de serviço para o usuário.
                supportedCapabilities: [#ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE], // Funciona como provedor analítico e fonte de dados SQL.
                modelingPattern: #ANALYTICAL_CUBE } // Segue o padrão de cubo analítico (usado para relatórios).

@Metadata: { ignorePropagatedAnnotations: true, // Ignora anotações herdadas de outras views.
             allowExtensions: true } // Permite extensões futuras nessa view.
@VDM: { lifecycle.contract.type: #PUBLIC_LOCAL_API, // Tipo de contrato, usado localmente e disponível para APIs públicas.
        viewType: #COMPOSITE } // Tipo da view: composta, pode combinar dados de várias fontes.
@Analytics.dataCategory: #CUBE // Categoriza essa view como um cubo analítico para relatórios.

define view ZCDS_SAC_EKKO_CUBE as select from ekko // Seleciona(consome) os dados que vem da tabela transparente (ekko)
{

    key ebeln,
    bukrs,
    bstyp,
    bsart

}
