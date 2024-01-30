DROP TABLE IF EXISTS fs_join;

CREATE TABLE fs_join AS

    SELECT 
          t1.dtReferencia,
          t1.idVendedor,
          t1.qtdePedidos,
          t1.qtdeDias,
          t1.qtdeItens,
          t1.qtdeRecencia,
          t1.avgTicket,
          t1.avgValorProduto,
          t1.maxValorProduto,
          t1.minValorProduto,
          t1.avgProdutoPedido,
          t1.minVlPedido,
          t1.maxVlPedido,
          t1.LTV,
          t1.qtdeDiasBase,
          t1.avgIntervaloVendas,

          t2.avgNota,
          t2.minNota,
          t2.maxNota,
          t2.pctAvaliacao,

          t3.qtdeUFsPedidos,
          t3.pctPedidoAC,
          t3.pctPedidoAL,
          t3.pctPedidoAM,
          t3.pctPedidoAP,
          t3.pctPedidoBA,
          t3.pctPedidoCE,
          t3.pctPedidoDF,
          t3.pctPedidoES,
          t3.pctPedidoGO,
          t3.pctPedidoMA,
          t3.pctPedidoMG,
          t3.pctPedidoMS,
          t3.pctPedidoMT,
          t3.pctPedidoPA,
          t3.pctPedidoPB,
          t3.pctPedidoPE,
          t3.pctPedidoPI,
          t3.pctPedidoPR,
          t3.pctPedidoRJ,
          t3.pctPedidoRN,
          t3.pctPedidoRO,
          t3.pctPedidoRR,
          t3.pctPedidoRS,
          t3.pctPedidoSC,
          t3.pctPedidoSE,
          t3.pctPedidoSP,
          t3.pctPedidoTO,

          t4.pctPedidoAtraso,
          t4.pctPedidoCancelado,
          t4.avgFrete,
          t4.maxFrete,
          t4.minFrete,
          t4.qtdeDiasAprovadoEntrega,
          t4.qtdeDiasPedidoEntrega,
          t4.qtdeDiasEntregaPromessa,

          t5.qtde_boleto_pedido,
          t5.qtde_credit_card_pedido,
          t5.qtde_voucher_pedido,
          t5.qtde_debit_card_pedido,
          t5.valor_boleto_pedido,
          t5.valor_credit_card_pedido,
          t5.valor_voucher_pedido,
          t5.valor_debit_card_pedido,
          t5.pct_qtde_boleto_pedido,
          t5.pct_qtde_credit_card_pedido,
          t5.pct_qtde_voucher_pedido,
          t5.pct_qtde_debit_card_pedido,
          t5.pct_valor_boleto_pedido,
          t5.pct_valor_credit_card_pedido,
          t5.pct_valor_voucher_pedido,
          t5.pct_valor_debit_card_pedido,
          t5.avgQtdeParcelas,
          t5.maxQtdeParcelas,
          t5.minQtdeParcelas,

          t6.avgFotos,
          t6.avgVolumeProduto,
          t6.minVolumeProduto,
          t6.maxVolumeProduto,
          t6.pctCategoriacama_mesa_banho,
          t6.pctCategoriabeleza_saude,
          t6.pctCategoriaesporte_lazer,
          t6.pctCategoriainformatica_acessorios,
          t6.pctCategoriamoveis_decoracao,
          t6.pctCategoriautilidades_domesticas,
          t6.pctCategoriarelogios_presentes,
          t6.pctCategoriatelefonia,
          t6.pctCategoriaautomotivo,
          t6.pctCategoriabrinquedos,
          t6.pctCategoriacool_stuff,
          t6.pctCategoriaferramentas_jardim,
          t6.pctCategoriaperfumaria,
          t6.pctCategoriabebes,
          t6.pctCategoriaeletronicos

    FROM fs_vendedor_vendas AS t1

    LEFT JOIN fs_vendedor_avaliacao AS t2
    ON t1.idVendedor = t2.idVendedor
    AND t1.dtReferencia = t2.dtReferencia

    LEFT JOIN fs_vendedor_cliente AS t3
    ON t1.idVendedor = t3.idVendedor
    AND t1.dtReferencia = t3.dtReferencia

    LEFT JOIN fs_vendedor_entrega AS t4
    ON t1.idVendedor = t4.idVendedor
    AND t1.dtReferencia = t4.dtReferencia

    LEFT JOIN fs_vendedor_pagamentos AS t5
    ON t1.idVendedor = t5.idVendedor
    AND t1.dtReferencia = t5.dtReferencia

    LEFT JOIN fs_vendedor_produto AS t6
    ON t1.idVendedor = t6.idVendedor
    AND t1.dtReferencia = t6.dtReferencia

    WHERE t1.dtReferencia = (select max(dtReferencia) from fs_vendedor_vendas);