Locales['pt'] = {

    -- TextUI

    ['buy_business'] = {
        text = '[E] Comprar ${road} ${name} por ${price}' .. Config.Currency,
        color = 'darkblue',
        side = 'right'
    },

    ['access_business'] = {
        text = '[E] Abrir ${name}',
        color = 'darkblue',
        side = 'right'
    },

    ['get_item'] = {
        text = '[E] Pegar na caixa',
        color = 'darkblue',
        side = 'right'
    },

    ['put_item'] = {
        text = '[E] Colocar caixa na carrinha',
        color = 'darkblue',
        side = 'right'
    },

    ['finish_mission'] = {
        text = '[E] Terminar Missão',
        color = 'darkblue',
        side = 'right'
    },

    -- Requests

    ['hired_requests'] = {
        text = 'Queres ser contratado para',
    },

    -- Error Notifications

    ['something_wrong'] = {
        title = 'Shop',
        text = 'Alguma coisa correu mal, tenta novamente mais tarde',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money'] = {
        title = 'Shop',
        text = 'Não tens dinheiro suficiente',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_business'] = {
        title = 'Shop',
        text = 'Não tens dinheiro suficiente na empresa',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_order'] = {
        title = 'Shop',
        text = 'A empresa não tem dinheiro suficiente para pagar o pedido',
        type = 'error',
        time = 5000,
    },

    ['max_stores'] = {
        title = 'Shop',
        text = 'Atingiste o máximo de lojas que podes ter',
        type = 'error',
        time = 5000,
    },

    ['near_error'] = {
        title = 'Shop',
        text = 'Sem ninguém por perto',
        type = 'error',
        time = 5000,
    },

    ['already_employee'] = {
        title = 'Shop',
        text = '${name} já é teu funcionário',
        type = 'error',
        time = 5000,
    },

    ['max_employees'] = {
        title = 'Shop',
        text = 'Não podes contratar ${name} porque atingiste o máximo de ${max} funcionários',
        type = 'error',
        time = 5000,
    },

    ['cant_hire_yourself'] = {
        title = 'Shop',
        text = 'Não te podes contratar a ti mesmo',
        type = 'error',
        time = 5000,
    },

    ['change_own_grade'] = {
        title = 'Shop',
        text = 'Não podes alterar o teu próprio cargo',
        type = 'error',
        time = 5000,
    },

    ['employee_not_exist'] = {
        title = 'Shop',
        text = 'Esse funcionário não existe',
        type = 'error',
        time = 5000,
    },

    ['got_fired'] = {
        title = 'Shop',
        text = 'Foste despedido de ${store_name}',
        type = 'error',
        time = 5000,
    },

    ['fired_himself'] = {
        title = 'Shop',
        text = '${playerName} despediu-se',
        type = 'error',
        time = 5000,
    },

    ['more_than_max_stock'] = {
        title = 'Shop',
        text = 'Não podes encomendar ${amount}x ${name} porque o máximo de stock é ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['max_stock'] = {
        title = 'Shop',
        text = 'Não podes melhorar o stock porque o máximo é ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['only_one_order'] = {
        title = 'Shop',
        text = 'Não podes aceitar outra missão enquanto tens outra ativa',
        type = 'error',
        time = 5000,
    },

    ['order_canceled'] = {
        title = 'Shop',
        text = 'Tu cancelaste a missão',
        type = 'error',
        time = 5000,
    },

    ['order_limit_reached'] = {
        title = 'Shop',
        text = 'Não podes encomendar mais de ${amount} produtos no mesmo pedido',
        type = 'error',
        time = 5000,
    },

    ['too_far'] = {
        title = 'Shop',
        text = 'Estás demasiado longe das caixas',
        type = 'error',
        time = 5000,
    },

    ['far_from_trunk'] = {
        title = 'Shop',
        text = 'Estás demasiado longe da mala da carrinha',
        type = 'error',
        time = 5000,
    },

    ['out_of_vehicle'] = {
        title = 'Shop',
        text = 'Tens de sair do veículo',
        type = 'error',
        time = 5000,
    },
    
    ['doors_closed'] = {
        title = 'Shop',
        text = 'A mala está fechada',
        type = 'error',
        time = 5000,
    },

    ['max_price_change'] = {
        title = 'Shop',
        text = 'O preço máximo para ${itemLabel} é ${maxPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['min_price_change'] = {
        title = 'Shop',
        text = 'O preço mínimo para ${itemLabel} é ${minPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['item_removed'] = {
        title = 'Shop',
        text = 'Tu removeste ${amount}x ${label} do carrinho',
        type = 'error',
        time = 5000,
    },

    ['item_removed_client'] = {
        title = 'Shop',
        text = 'Foi removido ${amount}x ${label} do carrinho porque alguém comprou',
        type = 'error',
        time = 5000,
    },

    ['cart_updated'] = {
        title = 'Shop',
        text = 'Não podes concluir a compra porque o item não está disponível',
        type = 'error',
        time = 5000,
    },

    ['pockets_full'] = {
        title = 'Shop',
        text = 'Não tens espaço suficiente no inventário para carregar esses itens',
        type = 'error',
        time = 5000,
    },

    ['item_unavailable'] = {
        title = 'Shop',
        text = 'O item ${name} não existe',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_item'] = {
        title = 'Shop',
        text = 'Tentaste dar exploit no item que devias receber',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_money'] = {
        title = 'Shop',
        text = 'Tentaste dar exploit no preço do item',
        type = 'error',
        time = 5000,
    },

    -- Success Notifications

    ['bought_store'] = {
        title = 'Shop',
        text = 'Compraste ${name} por ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['money_deposited'] = {
        title = 'Shop',
        text = 'Depositaste ${money}' .. Config.Currency .. ' na empresa',
        type = 'success',
        time = 5000,
    },

    ['money_withdrawn'] = {
        title = 'Shop',
        text = 'Levantaste ${money}' .. Config.Currency .. ' da empresa',
        type = 'success',
        time = 5000,
    },

    ['sold_business'] = {
        title = 'Shop',
        text = 'Vendeste a empresa por ${money}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['change_rank'] = {
        title = 'Shop',
        text = 'Alteraste o cargo de ${name} para ${job}',
        type = 'success',
        time = 5000,
    },

    ['got_hired'] = {
        title = 'Shop',
        text = 'Foste contratado para ${store_name}',
        type = 'success',
        time = 5000,
    },

    ['success_hired'] = {
        title = 'Shop',
        text = 'Contrataste ${hired_name}',
        type = 'success',
        time = 5000,
    },

    ['success_fired'] = {
        title = 'Shop',
        text = 'Despediste ${fired_name}',
        type = 'success',
        time = 5000,
    },

    ['fired_yourself'] = {
        title = 'Shop',
        text = 'Despediste-te com sucesso',
        type = 'success',
        time = 5000,
    },

    ['ordered_success'] = {
        title = 'Shop',
        text = 'Tu criaste um pedido de ${amount}x ${item} por ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['order_completed'] = {
        title = 'Shop',
        text = 'Tu terminaste a missão e recebeste ${reward}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['vehicle_filled'] = {
        title = 'Shop',
        text = 'Colocaste todas as caixas na carrinha, volta para a loja',
        type = 'success',
        time = 5000,
    },

    ['changed_item_price'] = {
        title = 'Shop',
        text = 'Tu alteraste o preço de ${itemLabel} para ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['updated_stock'] = {
        title = 'Shop',
        text = 'Tu melhoraste o stock máximo de ${maxStock} para ${maxStockUpdated} por ${price} ' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['item_added'] = {
        title = 'Shop',
        text = 'Adicionaste ${amount}x ${label} ao carrinho',
        type = 'success',
        time = 5000,
    },
    
    ['purchased_success'] = {
        title = 'Shop',
        text = 'A tua compra foi realizada com sucesso, pagaste ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    -- Info Notifications

    ['start_mission'] = {
        title = 'Shop',
        text = 'Vai para o veículo para começar a missão',
        type = 'info',
        time = 5000,
    },

    ['mission_location'] = {
        title = 'Shop',
        text = 'Vai para a localização marcada no mapa',
        type = 'info',
        time = 5000,
    },

    ['pick_another_box'] = {
        title = 'Shop',
        text = 'Caixa colocada no veículo, pega noutra caixa',
        type = 'info',
        time = 5000,
    },
    
    ['put_box_truck'] = {
        title = 'Shop',
        text = 'Põe a caixa na carrinha',
        type = 'info',
        time = 5000,
    },

    ['doors_open'] = {
        title = 'Shop',
        text = 'A mala da carrinha tem de estar aberta',
        type = 'info',
        time = 5000,
    },

    ['amount_changed'] = {
        title = 'Shop',
        text = 'Tu alteraste a quantia de ${label} para ${amount}x',
        type = 'info',
        time = 5000,
    },

    -- UI

    ['translations'] = {
        menu = 'Menu',
        overview = 'Geral',
        stock = 'Stock',
        orders = 'Pedidos',
        price = 'Preço',
        employees = 'Funcionários',
        saleshistory = 'Histórico',
        logout = 'Sair',
        finances = 'Finanças',
        deposit = 'Depositar',
        withdraw = 'Levantar',
        items = 'Itens',
        totalcapacity = 'Capacidade Total',
        mostsolditems = 'Itens Mais Vendidos',
        balance = 'Quantia',
        sellbusiness = 'Vender Negócio',
        buybusiness = 'Comprar Negócio',
        stockalert = 'Alerta de Stock',
        search = 'Procurar...',
        noentriesfound = 'Sem resultados encontrados',
        noresults = 'Nenhum resultado encontrado para essa pesquisa',
        selectorder = 'Seleciona um pedido',
        neworder = 'Novo Pedido',
        quitjob = 'Despedir',
        accept = 'ACEITAR',
        cancel = 'CANCELAR',
        accepted = 'ACEITE',
        edit = 'EDITAR',
        item = 'Item',
        amount = 'Quantia',
        reward = 'Recompensa',
        employee = 'Empregado',
        actions = 'Ações',
        owner = 'Dono',
        name = 'Nome',
        grade = 'Grau',
        totalorders = 'Pedidos Totais',
        hireemployee = 'Contratar Funcionário',
        maxstock = 'Stock Máximo Atingido',
        selectuser = 'Seleciona um funcionário',
        loggingout = 'A sair...',
        loadingdata = 'A carregar...',
        fireemployee = 'Queres despedir',
        buyer = 'Comprador',
        date = 'Data',
        totalsold = 'Total Vendidos',
        stockgood = 'Stock está bom',
        lowstock = 'precisa de restock',
        confirm = 'Confirmar',
        areyousure = 'Tens a certeza?',
        doyouwanttobuy = 'Queres comprar',
        sellbusinessfor = 'Queres vender o teu negócio por',
        buyfor = 'por',
        cancelbutton = 'Cancelar',
        buybutton = 'Comprar',
        sellbutton = 'Vender',
        firebutton = 'Despedir',
        firemyself = 'Queres mesmo despedir-te?',
        depositmoney = 'Depositar Dinheiro',
        withdrawmoney = 'Levantar Dinheiro',
        increasecapacity = 'Aumentar Capacidade',
        fireemployeetitle = 'Despedir Funcionário',
        editemployee = 'Editar Funcionário',
        edititem = 'Editar Item',
        save = 'Guardar',
        hire = 'Contratar',
        currentprice = 'Preço Atual',
        newprice = 'Novo Preço',
        none = 'Nenhum',
        addtocart = 'Adicionar',
        outofstock = 'Fora de Stock',
        emptycart = 'O teu carrinho está vazio',
        onCart = 'No Carrinho',
        notOwnedShopName = '24/7',
        checkout = 'Finalizar Compra',
        summary = 'Resumo',
        total = 'TOTAL',
        paywith = 'Pagar com',
        cash = 'Dinheiro',
        card = 'Cartão',
        boughtitems = 'Itens Comprados',
        shop = 'Loja',
        insufficientfunds = 'Fundos Insuficientes',
        open = "Abrir",
        manage = "Gerir",
    },
}