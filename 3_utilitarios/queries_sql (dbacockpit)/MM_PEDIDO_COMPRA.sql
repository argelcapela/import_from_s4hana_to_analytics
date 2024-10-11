select distinct 
               ekbe.ebeln as numero_documento_compra,
               ekbe.belnr as numero_item_pedido_compra,
               ekbe.vgabe as tipo_operacao_realizada,
               ekbe.bwart as tipo_movimento_realizado,
               eban.badat as data_solicitacao,
               ekbe.budat as data_recebimento,
               days_between(eban.badat, ekbe.budat) as lead_time,
               eban.matnr as numero_material,
               eban.txz01 as texto_material,
               ekpo.menge as quantidade_pedida,
               ekpo.ktmng as quantidade_prevista,
               ekpo.netpr as preco_liquido_documento_compra,
               ekpo.netwr as valor_liquido_em_moeda_pedido,
               ekpo.brtwr as valor_bruto_em_moeda_pedido,
               eban.ernam as responsavel,
               rkpf.kostl as numero_centro_custo,
               cskt.ltext as texto_centro_custo,
               ekko.ekgrp as numero_grupo_comprador,
               t024.eknam as texto_grupo_comprador,
               ekko.lifnr as numero_fornecedor,
               lfa1.name1 as texto_fornecedor      
from ekbe

inner join ekko on ekbe.ebeln = ekko.ebeln
inner join ekpo on ekbe.ebeln = ekpo.ebeln and ekbe.ebelp = ekpo.ebelp
inner join eban on eban.banfn = ekpo.banfn and eban.bnfpo = ekpo.bnfpo
right join rkpf on eban.ernam = rkpf.usnam
right join cskt on rkpf.kostl = cskt.kostl
right join t024 on ekko.ekgrp = t024.ekgrp
right join lfa1 on ekko.lifnr = lfa1.lifnr

where vgabe = '1' and days_between(eban.badat, ekbe.budat) >= 0

order by lead_time asc
