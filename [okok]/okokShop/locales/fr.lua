Locales['fr'] = {

    -- TextUI

    ['buy_business'] = {
        text = '[E] Acheter ${road} ${name} pour ${price}' .. Config.Currency,
        color = 'darkblue',
        side = 'right'
    },

    ['access_business'] = {
        text = '[E] Ouvrir ${name}',
        color = 'darkblue',
        side = 'right'
    },

    ['get_item'] = {
        text = '[E] Prendre une boite',
        color = 'darkblue',
        side = 'right'
    },

    ['put_item'] = {
        text = '[E] Poser la boite dans le fourgon',
        color = 'darkblue',
        side = 'right'
    },

    ['finish_mission'] = {
        text = '[E] Finir la mission',
        color = 'darkblue',
        side = 'right'
    },

    -- Requests

    ['hired_requests'] = {
        text = 'Voulez-vous être emplyé par',
    },

    -- Error Notifications

    ['something_wrong'] = {
        title = 'Shop',
        text = 'Quelque chose c\'est mal passé, essayez plus tard',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money'] = {
        title = 'Shop',
        text = 'Vous n\'avez pas assez d\'argent',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_business'] = {
        title = 'Shop',
        text = 'Vous n\'avez pas assez d\'argent dans votre magasin',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_order'] = {
        title = 'Shop',
        text = 'Le magasin ne dispose pas assez d\'argent pour commander',
        type = 'error',
        time = 5000,
    },

    ['max_stores'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas acheter plus de magasin',
        type = 'error',
        time = 5000,
    },

    ['near_error'] = {
        title = 'Shop',
        text = 'Personne à côté',
        type = 'error',
        time = 5000,
    },

    ['already_employee'] = {
        title = 'Shop',
        text = '${name} est déjà employé dans votre magasin',
        type = 'error',
        time = 5000,
    },

    ['max_employees'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas ${name} parceque vous avez déjà ${max} employés dans votre magasin',
        type = 'error',
        time = 5000,
    },

    ['cant_hire_yourself'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas vous embaucher',
        type = 'error',
        time = 5000,
    },

    ['change_own_grade'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas changer votre propre statut',
        type = 'error',
        time = 5000,
    },

    ['employee_not_exist'] = {
        title = 'Shop',
        text = 'Cet employé n\'existe pas',
        type = 'error',
        time = 5000,
    },

    ['got_fired'] = {
        title = 'Shop',
        text = 'Vous avez été renvoyé de ${store_name}',
        type = 'error',
        time = 5000,
    },

    ['fired_himself'] = {
        title = 'Shop',
        text = '${playerName} a démissionné',
        type = 'error',
        time = 5000,
    },

    ['more_than_max_stock'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas commander ${amount}x ${name} car vous pouvez en stocker ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['max_stock'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas faire de mise à jour car votre stock maximum est de ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['only_one_order'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas accepter une commande quand vous en avez déjà une d\'active',
        type = 'error',
        time = 5000,
    },

    ['order_canceled'] = {
        title = 'Shop',
        text = 'vous avez annulé la commande',
        type = 'error',
        time = 5000,
    },

    ['order_limit_reached'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas commander plus que ${amount} objet au même moment',
        type = 'error',
        time = 5000,
    },

    ['too_far'] = {
        title = 'Shop',
        text = 'Vous êtes trop loin du client',
        type = 'error',
        time = 5000,
    },

    ['far_from_trunk'] = {
        title = 'Shop',
        text = 'Vous êtes trop loin du coffre',
        type = 'error',
        time = 5000,
    },

    ['out_of_vehicle'] = {
        title = 'Shop',
        text = 'Vous devez sortir du véhicule',
        type = 'error',
        time = 5000,
    },
    
    ['doors_closed'] = {
        title = 'Shop',
        text = 'Le coffre du véhicule est fermé',
        type = 'error',
        time = 5000,
    },

    ['max_price_change'] = {
        title = 'Shop',
        text = 'Le prix maximum que vous pouvez définir pour ${itemLabel} est de ${maxPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['min_price_change'] = {
        title = 'Shop',
        text = 'Le prix minimum que vous pouvez définir pour ${itemLabel} est de ${minPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['item_removed'] = {
        title = 'Shop',
        text = 'Vous avez retiré ${amount}x ${label} du chariot',
        type = 'error',
        time = 5000,
    },

    ['item_removed_client'] = {
        title = 'Shop',
        text = '${amount}x ${label} a été retiré du chariot car ils ne sont plus disponibles',
        type = 'error',
        time = 5000,
    },

    ['cart_updated'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas poursuivre vos achats car les objets ne sont plus disponibles',
        type = 'error',
        time = 5000,
    },

    ['pockets_full'] = {
        title = 'Shop',
        text = 'Vous ne pouvez pas prendre plus d\'objet sur vous, ça devient trop lourd',
        type = 'error',
        time = 5000,
    },

    ['item_unavailable'] = {
        title = 'Shop',
        text = 'L\'objet ${name} n\'existe pas',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_item'] = {
        title = 'Shop',
        text = 'Vous avez essayé de manipuler l\'objet',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_money'] = {
        title = 'Shop',
        text = 'Vous avez essayé de manipuler le prix de l\'objet',
        type = 'error',
        time = 5000,
    },

    -- Success Notifications

    ['bought_store'] = {
        title = 'Shop',
        text = 'Vous avez acheté ${name} pour ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['money_deposited'] = {
        title = 'Shop',
        text = 'Vous avez déposé ${money}' .. Config.Currency .. ' dans votre magasin',
        type = 'success',
        time = 5000,
    },

    ['money_withdrawn'] = {
        title = 'Shop',
        text = 'vous avez retiré ${money}' .. Config.Currency .. ' de votre magasin',
        type = 'success',
        time = 5000,
    },

    ['sold_business'] = {
        title = 'Shop',
        text = 'Le solde de votre magasin est de ${money}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['change_rank'] = {
        title = 'Shop',
        text = 'Vous avez change le statut de ${name} pour ${job}',
        type = 'success',
        time = 5000,
    },

    ['got_hired'] = {
        title = 'Shop',
        text = 'Vous avez été recruté au magasin ${store_name}',
        type = 'success',
        time = 5000,
    },

    ['success_hired'] = {
        title = 'Shop',
        text = 'Vous avez recruté ${hired_name}',
        type = 'success',
        time = 5000,
    },

    ['success_fired'] = {
        title = 'Shop',
        text = 'Vous avez licencié ${fired_name}',
        type = 'success',
        time = 5000,
    },

    ['fired_yourself'] = {
        title = 'Shop',
        text = 'Vous avez démissionné',
        type = 'success',
        time = 5000,
    },

    ['ordered_success'] = {
        title = 'Shop',
        text = 'Vous avez fait une commande de ${amount}x ${item} pour ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['order_completed'] = {
        title = 'Shop',
        text = 'Vous avez réussi votre commande et avez reçu ${reward}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['vehicle_filled'] = {
        title = 'Shop',
        text = 'Vous avez toutes les boites, retournez au magasin',
        type = 'success',
        time = 5000,
    },

    ['changed_item_price'] = {
        title = 'Shop',
        text = 'Vous avez changé le prix de ${itemLabel} pour ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['updated_stock'] = {
        title = 'Shop',
        text = 'Vous avez aumgenté votre stock maximum de ${maxStock} à ${maxStockUpdated} pour ${price} ' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['item_added'] = {
        title = 'Shop',
        text = 'vous avez ajouté ${amount}x ${label} à votre chariot',
        type = 'success',
        time = 5000,
    },
    
    ['purchased_success'] = {
        title = 'Shop',
        text = 'Votre paiment a bien fonctionné, vous avez payé ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    -- Info Notifications

    ['start_mission'] = {
        title = 'Shop',
        text = 'Allez dans le véhicule pour démarrer votre mission',
        type = 'info',
        time = 5000,
    },

    ['mission_location'] = {
        title = 'Shop',
        text = 'Regardez votre GPS et dirigez vous sur la position indiquée',
        type = 'info',
        time = 5000,
    },

    ['pick_another_box'] = {
        title = 'Shop',
        text = 'Vous avez posé la boite dans le véhicule, allez en chercher une autre',
        type = 'info',
        time = 5000,
    },
    
    ['put_box_truck'] = {
        title = 'Shop',
        text = 'Mettez la boite dans le véhicule',
        type = 'info',
        time = 5000,
    },

    ['doors_open'] = {
        title = 'Shop',
        text = 'Vous devez ouvrir les portes arrières de votre véhicule',
        type = 'info',
        time = 5000,
    },

    ['amount_changed'] = {
        title = 'Shop',
        text = 'Vous avez changer le nombre de ${label} pour ${amount}x',
        type = 'info',
        time = 5000,
    },

    -- UI
    
    ['translations'] = {
        menu = 'Menu',
        overview = 'Vue d\'ensemble',
        stock = 'Stock',
        orders = 'Commandes',
        price = 'Prix',
        employees = 'Employés',
        saleshistory = 'Historique des ventes',
        logout = 'Déconnexion',
        finances = 'Finances',
        deposit = 'Dépôt',
        withdraw = 'Retrait',
        items = 'Articles',
        totalcapacity = 'Capacité totale',
        mostsolditems = 'Articles les plus vendus',
        balance = 'Solde',
        sellbusiness = 'Vendre le magasin',
        buybusiness = 'Acheter le magasin',
        stockalert = 'Stock alerte',
        search = 'Recherche...',
        noentriesfound = 'Aucune entrée trouvée',
        noresults = 'Aucun résultat ne correspond',
        selectorder = 'Sélectionner une commande',
        neworder = 'Nouvelle commande',
        quitjob = 'Démissionner',
        accept = 'ACCEPTER',
        cancel = 'ANNULER',
        accepted = 'ACCEPTÉ',
        edit = 'ÉDITER',
        item = 'Article',
        amount = 'Montant',
        reward = 'Récompense',
        employee = 'Employé',
        actions = 'Actions',
        owner = 'Gérant',
        name = 'Nom',
        grade = 'Rang',
        totalorders = 'Commandes totales',
        hireemployee = 'Recruter',
        maxstock = 'Stock maximum atteint',
        selectuser = 'Sélectionner une personne',
        loggingout = 'Déconnexion...',
        loadingdata = 'Chargement des données...',
        fireemployee = 'Voulez-vous licencier',
        buyer = 'Acheter',
        date = 'Date',
        totalsold = 'Total des ventes',
        stockgood = 'Stock OK',
        lowstock = 'Restock nécessaire',
        confirm = 'Confirmer',
        areyousure = 'Vous êtes sûr ?',
        doyouwanttobuy = 'Voulez vous acheter',
        sellbusinessfor = 'Voulez vous vendre votre magasin pour',
        buyfor = 'pour',
        cancelbutton = 'Annuler',
        buybutton = 'Acheter',
        sellbutton = 'Vendre',
        firebutton = 'Licencier',
        firemyself = 'Voulez vous démissionner ?',
        depositmoney = 'Déposer de l\'argent',
        withdrawmoney = 'Retirer de l\'argent',
        increasecapacity = 'Augmenter les capacités',
        fireemployeetitle = 'Licencier l\'employé',
        editemployee = 'Modifier l\'employé',
        edititem = 'Éditer l\'article',
        save = 'Sauvegarder',
        hire = 'Employer',
        currentprice = 'Prix actuel',
        newprice = 'Nouveau prix',
        none = 'Aucun',
        addtocart = 'Ajouter au chariot',
        outofstock = 'Rupture de stock',
        emptycart = 'Votre chariot est vide',
        onCart = 'Dans le chariot',
        notOwnedShopName = '24/7',
        checkout = 'Sortir',
        summary = 'Résumé',
        total = 'TOTAL',
        paywith = 'Payer en',
        cash = 'Liquide',
        card = 'Carte',
        boughtitems = 'Articles achetés',
        shop = 'Magasin',
        insufficientfunds = 'Fonds insuffisants',
        open = "Open",
        manage = "Gérer",
    },
}