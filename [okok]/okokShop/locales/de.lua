Locales['de'] = {

    -- TextUI

    ['buy_business'] = {
        text = '[E] Kaufe ${road} ${name} für ${price}' .. Config.Currency,
        color = 'darkblue',
        side = 'right'
    },

    ['access_business'] = {
        text = '[E] Öffne ${name}',
        color = 'darkblue',
        side = 'right'
    },

    ['get_item'] = {
        text = '[E] Heben Sie die Box auf',
        color = 'darkblue',
        side = 'right'
    },

    ['put_item'] = {
        text = '[E] Legen Sie die Box in den Transporter',
        color = 'darkblue',
        side = 'right'
    },

    ['finish_mission'] = {
        text = '[E] Mission beenden',
        color = 'darkblue',
        side = 'right'
    },

    -- Requests

    ['hired_requests'] = {
        text = 'Möchten Sie eingestellt werden von',
    },

    -- Error Notifications

    ['something_wrong'] = {
        title = 'Shop',
        text = 'Etwas ist schief gelaufen, versuchen Sie es später noch einmal',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money'] = {
        title = 'Shop',
        text = 'Sie haben nicht genug Geld',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_business'] = {
        title = 'Shop',
        text = 'Sie haben nicht genug Geld auf dem Geschäftskonto',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_order'] = {
        title = 'Shop',
        text = 'Der Laden hat nicht genug Geld, um die Bestellung zu bezahlen',
        type = 'error',
        time = 5000,
    },

    ['max_stores'] = {
        title = 'Shop',
        text = 'Sie haben die maximale Anzahl an eigenen Geschäften erreicht',
        type = 'error',
        time = 5000,
    },

    ['near_error'] = {
        title = 'Shop',
        text = 'Keiner in der Nähe',
        type = 'error',
        time = 5000,
    },

    ['already_employee'] = {
        title = 'Shop',
        text = '${name} ist bereits in Ihrem Shop angestellt',
        type = 'error',
        time = 5000,
    },

    ['max_employees'] = {
        title = 'Shop',
        text = 'Sie können ${name} nicht einstellen, weil Sie die maximale Anzahl von ${max} Mitarbeitern im Geschäft erreicht haben',
        type = 'error',
        time = 5000,
    },

    ['cant_hire_yourself'] = {
        title = 'Shop',
        text = 'Sie können sich nicht selbst einstellen',
        type = 'error',
        time = 5000,
    },

    ['change_own_grade'] = {
        title = 'Shop',
        text = 'Sie können Ihren eigenen Rang nicht ändern',
        type = 'error',
        time = 5000,
    },

    ['employee_not_exist'] = {
        title = 'Shop',
        text = 'Diesen Mitarbeiter gibt es nicht.',
        type = 'error',
        time = 5000,
    },

    ['got_fired'] = {
        title = 'Shop',
        text = 'Sie wurden von ${store_name} gefeuert',
        type = 'error',
        time = 5000,
    },

    ['fired_himself'] = {
        title = 'Shop',
        text = '${playerName} hat sich selbst entlassen',
        type = 'error',
        time = 5000,
    },

    ['more_than_max_stock'] = {
        title = 'Shop',
        text = 'Sie können ${amount}x ${name} nicht bestellen, weil der maximale Bestand Ihres Shops ${maxStock} ist',
        type = 'error',
        time = 5000,
    },

    ['max_stock'] = {
        title = 'Shop',
        text = 'Sie können diese Aktualisierung nicht vornehmen, weil der Höchstbestand ${maxStock} ist',
        type = 'error',
        time = 5000,
    },

    ['only_one_order'] = {
        title = 'Shop',
        text = 'Sie können keinen Auftrag annehmen, während Sie einen aktiven Auftrag haben',
        type = 'error',
        time = 5000,
    },

    ['order_canceled'] = {
        title = 'Shop',
        text = 'Sie haben die Bestellung abgebrochen',
        type = 'error',
        time = 5000,
    },

    ['order_limit_reached'] = {
        title = 'Shop',
        text = 'Sie können nicht mehr als ${amount} Artikel gleichzeitig bestellen',
        type = 'error',
        time = 5000,
    },

    ['too_far'] = {
        title = 'Shop',
        text = 'Sie sind zu weit vom Lieferanten entfernt',
        type = 'error',
        time = 5000,
    },

    ['far_from_trunk'] = {
        title = 'Shop',
        text = 'Sie sind zu weit vom Kofferraum entfernt',
        type = 'error',
        time = 5000,
    },

    ['out_of_vehicle'] = {
        title = 'Shop',
        text = 'Sie müssen aus dem Fahrzeug aussteigen',
        type = 'error',
        time = 5000,
    },
    
    ['doors_closed'] = {
        title = 'Shop',
        text = 'Der Kofferraum des Fahrzeugs ist geschlossen',
        type = 'error',
        time = 5000,
    },

    ['max_price_change'] = {
        title = 'Shop',
        text = 'Der maximale Preis, den Sie für ${itemLabel} festlegen können, ist ${maxPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['min_price_change'] = {
        title = 'Shop',
        text = 'Der Mindestpreis, den Sie für ${itemLabel} festlegen können, ist ${minPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['item_removed'] = {
        title = 'Shop',
        text = 'Sie haben ${amount}x ${label} aus dem Warenkorb entfernt',
        type = 'error',
        time = 5000,
    },

    ['item_removed_client'] = {
        title = 'Shop',
        text = 'Entferne ${amount}x ${label} aus dem Warenkorb, weil jemand es gekauft hat',
        type = 'error',
        time = 5000,
    },

    ['cart_updated'] = {
        title = 'Shop',
        text = 'Sie können den Kauf nicht abschließen, weil der Artikel nicht mehr verfügbar ist.',
        type = 'error',
        time = 5000,
    },

    ['pockets_full'] = {
        title = 'Shop',
        text = 'Sie können nicht so viele Gegenstände in ihrem Inventar haben.',
        type = 'error',
        time = 5000,
    },

    ['item_unavailable'] = {
        title = 'Shop',
        text = 'Der Artikel ${name} existiert nicht',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_item'] = {
        title = 'Shop',
        text = 'Sie haben versucht, den Artikel zu manipulieren',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_money'] = {
        title = 'Shop',
        text = 'Sie haben versucht, den Preis zu manipulieren',
        type = 'error',
        time = 5000,
    },

    -- Success Notifications

    ['bought_store'] = {
        title = 'Shop',
        text = 'Sie haben ${name} für ${price}'.. Config.Currency..' gekauft',
        type = 'success',
        time = 5000,
    },

    ['money_deposited'] = {
        title = 'Shop',
        text = 'Sie haben ${money}' .. Config.Currency .. 'eingezahlt auf das Geschäftskonto',
        type = 'success',
        time = 5000,
    },

    ['money_withdrawn'] = {
        title = 'Shop',
        text = 'Sie haben ${money}' .. Config.Currency .. ' abgehoben vom Geschäftskonto',
        type = 'success',
        time = 5000,
    },

    ['sold_business'] = {
        title = 'Shop',
        text = 'Sie haben das Geschäft für ${money}' .. Config.Currency..' verkauft',
        type = 'success',
        time = 5000,
    },

    ['change_rank'] = {
        title = 'Shop',
        text = 'ie haben den Rang von ${name} in ${job} geändert',
        type = 'success',
        time = 5000,
    },

    ['got_hired'] = {
        title = 'Shop',
        text = 'Sie wurden für den ${store_name} eingestellt',
        type = 'success',
        time = 5000,
    },

    ['success_hired'] = {
        title = 'Shop',
        text = 'Sie haben ${hired_name} eingestellt',
        type = 'success',
        time = 5000,
    },

    ['success_fired'] = {
        title = 'Shop',
        text = 'Sie haben ${fired_name} gefeuert',
        type = 'success',
        time = 5000,
    },

    ['fired_yourself'] = {
        title = 'Shop',
        text = 'Sie haben sich erfolgreich selbst entlassen',
        type = 'success',
        time = 5000,
    },

    ['ordered_success'] = {
        title = 'Shop',
        text = 'Sie haben eine Bestellung ${amount}x ${item} für ${price}' .. Config.Currency..' aufgegeben',
        type = 'success',
        time = 5000,
    },

    ['order_completed'] = {
        title = 'Shop',
        text = 'Sie haben die Bestellung erfolgreich abgeschlossen und erhalten ${reward}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['vehicle_filled'] = {
        title = 'Shop',
        text = 'Sie haben alle Pakete, gehen Sie zurück in den Laden',
        type = 'success',
        time = 5000,
    },

    ['changed_item_price'] = {
        title = 'Shop',
        text = 'Sie haben den Preis für ${itemLabel} to ${price}' .. Config.Currency..' geändert',
        type = 'success',
        time = 5000,
    },

    ['updated_stock'] = {
        title = 'Shop',
        text = 'Sie haben den maximalen Bestand von ${maxStock} zu ${maxStockUpdated} geändert für ${price} ' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['item_added'] = {
        title = 'Shop',
        text = 'Sie haben ${amount}x ${label} in den Warenkorb gelegt',
        type = 'success',
        time = 5000,
    },
    
    ['purchased_success'] = {
        title = 'Shop',
        text = 'hr Kauf war erfolgreich, Sie haben ${price}' .. Config.Currency..' bezahlt',
        type = 'success',
        time = 5000,
    },

    -- Info Notifications

    ['start_mission'] = {
        title = 'Shop',
        text = 'Gehen Sie zum Fahrzeug, um die Mission zu starten.',
        type = 'info',
        time = 5000,
    },

    ['mission_location'] = {
        title = 'Shop',
        text = 'Gehen Sie zu dem auf Ihrer Karte markierten Ort',
        type = 'info',
        time = 5000,
    },

    ['pick_another_box'] = {
        title = 'Shop',
        text = 'Box zum Fahrzeug hinzugefügt, holen Sie eine weitere Box',
        type = 'info',
        time = 5000,
    },
    
    ['put_box_truck'] = {
        title = 'Shop',
        text = 'Packen Sie die Box in den Lastwagen',
        type = 'info',
        time = 5000,
    },

    ['doors_open'] = {
        title = 'Shop',
        text = 'Die Hintertüren des Fahrzeugs müssen geöffnet werden',
        type = 'info',
        time = 5000,
    },

    ['amount_changed'] = {
        title = 'Shop',
        text = 'Sie haben den Betrag von ${label} auf ${amount}x geändert',
        type = 'info',
        time = 5000,
    },

    -- UI
    
    ['translations'] = {
        menu = 'Menü',
        overview = 'Übersicht',
        stock = 'Bestand',
        orders = 'Bestellungen',
        price = 'Preis',
        employees = 'Mitarbeiter',
        saleshistory = 'Verkaufshistorie',
        logout = 'Abmelden',
        finances = 'Finanzen',
        deposit = 'Einzahlen',
        withdraw = 'Abheben',
        items = 'Gegenstände',
        totalcapacity = 'Gesamtkapazität',
        mostsolditems = 'Meistverkaufte Artikel',
        balance = 'Kontostand',
        sellbusiness = 'Geschäft verkaufen',
        buybusiness = 'Geschäft kaufen',
        stockalert = 'Bestandswarnung',
        search = 'Suchen...',
        noentriesfound = 'Keine Einträge gefunden',
        noresults = 'Keine Ergebnisse entsprechen Ihrer Suchanfrage',
        selectorder = 'Bestellung auswählen',
        neworder = 'Neue Bestellung',
        quitjob = 'Job beenden',
        accept = 'AKZEPTIEREN',
        cancel = 'ABBRECHEN',
        accepted = 'AKZEPTIERT',
        edit = 'BEARBEITEN',
        item = 'Artikel',
        amount = 'Menge',
        reward = 'Belohnung',
        employee = 'Mitarbeiter',
        actions = 'Aktionen',
        owner = 'Besitzer',
        name = 'Name',
        grade = 'Rang',
        totalorders = 'Gesamtbestellungen',
        hireemployee = 'Mitarbeiter einstellen',
        maxstock = 'Maximaler Bestand erreicht',
        selectuser = 'Person auswählen',
        loggingout = 'Abmelden...',
        loadingdata = 'Daten werden geladen...',
        fireemployee = 'Möchten Sie kündigen',
        buyer = 'Käufer',
        date = 'Datum',
        totalsold = 'Insgesamt verkauft',
        stockgood = 'Bestand ist ausreichend',
        lowstock = 'niedriger Bestand',
        confirm = 'Bestätigen',
        areyousure = 'Sind Sie sicher?',
        doyouwanttobuy = 'Möchten Sie kaufen',
        sellbusinessfor = 'Möchten Sie das Geschäft verkaufen für',
        buyfor = 'für',
        cancelbutton = 'Abbrechen',
        buybutton = 'Kaufen',
        sellbutton = 'Verkaufen',
        firebutton = 'Kündigen',
        firemyself = 'Möchten Sie sich selbst kündigen?',
        depositmoney = 'Geld einzahlen',
        withdrawmoney = 'Geld abheben',
        increasecapacity = 'Kapazität erhöhen',
        fireemployeetitle = 'Mitarbeiter kündigen',
        editemployee = 'Mitarbeiter bearbeiten',
        edititem = 'Artikel bearbeiten',
        save = 'Speichern',
        hire = 'Einstellen',
        currentprice = 'Aktueller Preis',
        newprice = 'Neuer Preis',
        none = 'Keine',
        addtocart = 'hinzufügen',
        outofstock = 'Nicht vorrätig',
        emptycart = 'Ihr Warenkorb ist leer',
        onCart = 'Im Warenkorb',
        notOwnedShopName = '24/7',
        checkout = 'Kasse',
        summary = 'Zusammenfassung',
        total = 'GESAMT',
        paywith = 'Bezahlen mit',
        cash = 'Bargeld',
        card = 'Karte',
        boughtitems = 'Gekaufte Artikel',
        shop = 'Geschäft',
        insufficientfunds = 'Nicht ausreichend Guthaben',
        open = "Öffnen",
        manage = "Verwalten",
    },
}