Locales['es'] = {

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
        text = '[E] Recoger la caja',
        color = 'darkblue',
        side = 'right'
    },

    ['put_item'] = {
        text = '[E] Colocar la caja en la furgoneta',
        color = 'darkblue',
        side = 'right'
    },

    ['finish_mission'] = {
        text = '[E] Terminar misión',
        color = 'darkblue',
        side = 'right'
    },

    -- Requests

    ['hired_requests'] = {
        text = '¿Quieres ser contratado por',
    },

    -- Error Notifications

    ['something_wrong'] = {
        title = 'Tienda',
        text = 'Algo salió mal, inténtalo de nuevo más tarde',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money'] = {
        title = 'Tienda',
        text = 'No tienes suficiente dinero',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_business'] = {
        title = 'Tienda',
        text = 'No tienes suficiente dinero en el negocio',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_order'] = {
        title = 'Tienda',
        text = 'La tienda no tiene suficiente dinero para pagar el pedido',
        type = 'error',
        time = 5000,
    },

    ['max_stores'] = {
        title = 'Tienda',
        text = 'Has alcanzado el máximo de tiendas propiedad',
        type = 'error',
        time = 5000,
    },

    ['near_error'] = {
        title = 'Tienda',
        text = 'Nadie cerca',
        type = 'error',
        time = 5000,
    },

    ['already_employee'] = {
        title = 'Tienda',
        text = '${name} ya está empleado en tu tienda',
        type = 'error',
        time = 5000,
    },

    ['max_employees'] = {
        title = 'Tienda',
        text = 'No puedes contratar a ${name} porque has alcanzado el máximo de ${max} empleados en la tienda',
        type = 'error',
        time = 5000,
    },

    ['cant_hire_yourself'] = {
        title = 'Tienda',
        text = 'No puedes contratarte a ti mismo',
        type = 'error',
        time = 5000,
    },

    ['change_own_grade'] = {
        title = 'Tienda',
        text = 'No puedes cambiar tu propio rango',
        type = 'error',
        time = 5000,
    },

    ['employee_not_exist'] = {
        title = 'Tienda',
        text = 'Ese empleado no existe',
        type = 'error',
        time = 5000,
    },

    ['got_fired'] = {
        title = 'Tienda',
        text = 'Fuiste despedido de ${store_name}',
        type = 'error',
        time = 5000,
    },

    ['fired_himself'] = {
        title = 'Tienda',
        text = '${playerName} se despidió a sí mismo',
        type = 'error',
        time = 5000,
    },

    ['more_than_max_stock'] = {
        title = 'Tienda',
        text = 'No puedes pedir ${amount}x ${name} porque el stock máximo de tu tienda es ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['max_stock'] = {
        title = 'Tienda',
        text = 'No puedes hacer esa actualización porque el stock máximo es ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['only_one_order'] = {
        title = 'Tienda',
        text = 'No puedes aceptar un pedido mientras tengas uno activo',
        type = 'error',
        time = 5000,
    },

    ['order_canceled'] = {
        title = 'Tienda',
        text = 'Cancelaste el pedido',
        type = 'error',
        time = 5000,
    },

    ['order_limit_reached'] = {
        title = 'Tienda',
        text = 'No puedes pedir más de ${amount} artículos al mismo tiempo',
        type = 'error',
        time = 5000,
    },

    ['too_far'] = {
        title = 'Tienda',
        text = 'Estás demasiado lejos del proveedor',
        type = 'error',
        time = 5000,
    },

    ['far_from_trunk'] = {
        title = 'Tienda',
        text = 'Estás demasiado lejos del maletero',
        type = 'error',
        time = 5000,
    },

    ['out_of_vehicle'] = {
        title = 'Tienda',
        text = 'Debes salir del vehículo',
        type = 'error',
        time = 5000,
    },
    
    ['doors_closed'] = {
        title = 'Tienda',
        text = 'El maletero del vehículo está cerrado',
        type = 'error',
        time = 5000,
    },

    ['max_price_change'] = {
        title = 'Tienda',
        text = 'El precio máximo que puedes establecer para ${itemLabel} es ${maxPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['min_price_change'] = {
        title = 'Tienda',
        text = 'El precio mínimo que puedes establecer para ${itemLabel} es ${minPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['item_removed'] = {
        title = 'Tienda',
        text = 'Eliminaste ${amount}x ${label} del carrito',
        type = 'error',
        time = 5000,
    },

    ['item_removed_client'] = {
        title = 'Tienda',
        text = 'Se eliminó ${amount}x ${label} del carrito porque alguien lo compró',
        type = 'error',
        time = 5000,
    },

    ['cart_updated'] = {
        title = 'Tienda',
        text = 'No puedes concluir la compra porque el artículo ya no está disponible',
        type = 'error',
        time = 5000,
    },

    ['pockets_full'] = {
        title = 'Tienda',
        text = 'No puedes llevar tantos artículos en tu inventario',
        type = 'error',
        time = 5000,
    },

    ['item_unavailable'] = {
        title = 'Tienda',
        text = 'El artículo ${name} no existe',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_item'] = {
        title = 'Tienda',
        text = 'Intentaste explotar el artículo',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_money'] = {
        title = 'Tienda',
        text = 'Intentaste explotar el precio del artículo',
        type = 'error',
        time = 5000,
    },

    -- Success Notifications

    ['bought_store'] = {
        title = 'Tienda',
        text = 'Compraste ${name} por ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['money_deposited'] = {
        title = 'Tienda',
        text = 'Depositaste ${money}' .. Config.Currency .. ' en el negocio',
        type = 'success',
        time = 5000,
    },

    ['money_withdrawn'] = {
        title = 'Tienda',
        text = 'Retiraste ${money}' .. Config.Currency .. ' del negocio',
        type = 'success',
        time = 5000,
    },

    ['sold_business'] = {
        title = 'Tienda',
        text = 'Vendiste el negocio por ${money}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['change_rank'] = {
        title = 'Tienda',
        text = 'Cambió el rango de ${name} a ${job}',
        type = 'success',
        time = 5000,
    },

    ['got_hired'] = {
        title = 'Tienda',
        text = 'Fuiste contratado para ${store_name}',
        type = 'success',
        time = 5000,
    },

    ['success_hired'] = {
        title = 'Tienda',
        text = 'Contrataste a ${hired_name}',
        type = 'success',
        time = 5000,
    },

    ['success_fired'] = {
        title = 'Tienda',
        text = 'Despediste a ${fired_name}',
        type = 'success',
        time = 5000,
    },

    ['fired_yourself'] = {
        title = 'Tienda',
        text = 'Te despediste exitosamente a ti mismo',
        type = 'success',
        time = 5000,
    },

    ['ordered_success'] = {
        title = 'Tienda',
        text = 'Realizaste un pedido de ${amount}x ${item} por ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['order_completed'] = {
        title = 'Tienda',
        text = 'Terminaste con éxito el pedido y recibiste ${reward}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['vehicle_filled'] = {
        title = 'Tienda',
        text = 'Obtuviste todos los paquetes, regresa a la tienda',
        type = 'success',
        time = 5000,
    },

    ['changed_item_price'] = {
        title = 'Tienda',
        text = 'Cambió el precio de ${itemLabel} a ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['updated_stock'] = {
        title = 'Tienda',
        text = 'Actualizaste el stock máximo de ${maxStock} a ${maxStockUpdated} por ${price} ' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['item_added'] = {
        title = 'Tienda',
        text = 'Agregaste ${amount}x ${label} al carrito',
        type = 'success',
        time = 5000,
    },
    
    ['purchased_success'] = {
        title = 'Tienda',
        text = 'Tu compra fue exitosa, pagaste ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    -- Info Notifications

    ['start_mission'] = {
        title = 'Tienda',
        text = 'Ve al vehículo para comenzar la misión',
        type = 'info',
        time = 5000,
    },

    ['mission_location'] = {
        title = 'Tienda',
        text = 'Ve a la ubicación marcada en tu mapa',
        type = 'info',
        time = 5000,
    },

    ['pick_another_box'] = {
        title = 'Tienda',
        text = 'Caja añadida al vehículo, ve a buscar otra caja',
        type = 'info',
        time = 5000,
    },
    
    ['put_box_truck'] = {
        title = 'Tienda',
        text = 'Coloca la caja en la furgoneta',
        type = 'info',
        time = 5000,
    },

    ['doors_open'] = {
        title = 'Tienda',
        text = 'Las puertas traseras del vehículo deben estar abiertas',
        type = 'info',
        time = 5000,
    },

    ['amount_changed'] = {
        title = 'Tienda',
        text = 'Cambió la cantidad de ${label} a ${amount}x',
        type = 'info',
        time
    },

    -- UI
    
['translations'] = {
        menu = 'Menú',
        overview = 'Resumen',
        stock = 'Inventario',
        orders = 'Pedidos',
        price = 'Precio',
        employees = 'Empleados',
        saleshistory = 'Historial de Ventas',
        logout = 'Salir',
        finances = 'Finanzas',
        deposit = 'Depositar',
        withdraw = 'Retirar',
        items = 'Artículos',
        totalcapacity = 'Capacidad Total',
        mostsolditems = 'Artículos Más Vendidos',
        balance = 'Balance',
        sellbusiness = 'Vender Negocio',
        buybusiness = 'Comprar Negocio',
        stockalert = 'Alerta de Inventario',
        search = 'Buscar...',
        noentriesfound = 'No se encontraron entradas',
        noresults = 'No hay resultados que coincidan con tu búsqueda',
        selectorder = 'Seleccionar un pedido',
        neworder = 'Nuevo Pedido',
        quitjob = 'Renunciar',
        accept = 'ACEPTAR',
        cancel = 'CANCELAR',
        accepted = 'ACEPTADO',
        edit = 'EDITAR',
        item = 'Artículo',
        amount = 'Cantidad',
        reward = 'Recompensa',
        employee = 'Empleado',
        actions = 'Acciones',
        owner = 'Dueño',
        name = 'Nombre',
        grade = 'Rango',
        totalorders = 'Total de Pedidos',
        hireemployee = 'Contratar Empleado',
        maxstock = 'Máximo de Inventario Alcanzado',
        selectuser = 'Seleccionar una Persona',
        loggingout = 'Cerrando sesión...',
        loadingdata = 'Cargando Datos...',
        fireemployee = '¿Quieres despedir a',
        buyer = 'Comprador',
        date = 'Fecha',
        totalsold = 'Total Vendido',
        stockgood = 'Inventario en buen estado',
        lowstock = 'necesita reabastecimiento',
        confirm = 'Confirmar',
        areyousure = '¿Estás seguro?',
        doyouwanttobuy = '¿Quieres comprar',
        sellbusinessfor = '¿Quieres vender el negocio por',
        buyfor = 'por',
        cancelbutton = 'Cancelar',
        buybutton = 'Comprar',
        sellbutton = 'Vender',
        firebutton = 'Despedir',
        firemyself = '¿Quieres despedirte a ti mismo?',
        depositmoney = 'Depositar Dinero',
        withdrawmoney = 'Retirar Dinero',
        increasecapacity = 'Aumentar Capacidad',
        fireemployeetitle = 'Despedir Empleado',
        editemployee = 'Editar Empleado',
        edititem = 'Editar Artículo',
        save = 'Guardar',
        hire = 'Contratar',
        currentprice = 'Precio Actual',
        newprice = 'Nuevo Precio',
        none = 'Ninguno',
        addtocart = 'Agregar al Carrito',
        outofstock = 'Agotado',
        emptycart = 'Tu Carrito está Vacío',
        onCart = 'En Carrito',
        notOwnedShopName = '24/7',
        checkout = 'Pagar',
        summary = 'Resumen',
        total = 'TOTAL',
        paywith = 'Pagar con',
        cash = 'Efectivo',
        card = 'Tarjeta',
        boughtitems = 'Artículos Comprados',
        shop = 'Tienda',
        insufficientfunds = 'Fondos Insuficientes',
        open = "Ouvrir",
        manage = "Manejar",
    },
}