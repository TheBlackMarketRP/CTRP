--[[ This an example with all parameters

    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'itemname', 
        prepare = {emote = 'emotename', delay = 5000},
        hunger  = {add = 10, emote = 'emotename', delay = 50000},
        thirst  = {add = 10, emote = 'emotename', delay = 15000},
        stress  = {remove = 10, emote = 'emotename', delay = 15000},
    })

]]

--=====================================================================Burger Shot=====================================================================--
QBCore.Functions.CreateUseableItem('family_bundle_classic', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'family_bundle_classic', 
        prepare = {emote = 'foodtrayi', delay = 5000},
        hunger = {add = 100, emote = 'burger', delay = 50000},
        thirst = {add = 100, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('croissant_breakfast_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'croissant_breakfast_combo', 
        hunger = {add = 50, emote = 'burger', delay = 25000},
        thirst = {add = 50, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('deluxe_breakfast_croissant', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'deluxe_breakfast_croissant', 
        hunger = {add = 60, emote = 'sandwich', delay = 30000},
        thirst = {add = 30, emote = 'drink', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('sausage_croissant_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sausage_croissant_sandwich', 
        hunger = {add = 45, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('ham_cheese_breakfast_croissant', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'ham_cheese_breakfast_croissant', 
        hunger = {add = 40, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('double_sausage_croissant_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_sausage_croissant_sandwich',
        hunger = {add = 60, emote = 'burger', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('bacon_ham_sausage', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bacon_ham_sausage',
        hunger = {add = 40, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('double_sausage_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_sausage_biscuit',
        hunger = {add = 60, emote = 'burger', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('buttermilk_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'buttermilk_biscuit',
        hunger = {add = 60, emote = 'sandwich', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('supreme_breakfast_burrito', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'supreme_breakfast_burrito',
        hunger = {add = 20, emote = 'taco', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('pancake_sausage_platter', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pancake_sausage_platter', 
        hunger = {add = 50, emote = 'sandwich', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('small_hash_browns', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'small_hash_browns', 
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('french_toast_sticks', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'french_toast_sticks', 
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('triple_cheeseburger_supreme', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'triple_cheeseburger_supreme', 
        hunger = {add = 70, emote = 'burger', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('bacon_king', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bacon_king', 
        hunger = {add = 40, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('double_cheeseburger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_cheeseburger', 
        hunger = {add = 50, emote = 'burger', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('double_bacon_cheeseburger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_bacon_cheeseburger',
        hunger = {add = 50, emote = 'burger', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('bbq_onion_burger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bbq_onion_burger', 
        hunger = {add = 40, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('bs_hamburger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bs_hamburger',
        hunger = {add = 30, emote = 'burger', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('bbq_double_burger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bbq_double_burger', 
        hunger = {add = 60, emote = 'burger', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_chicken_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_chicken_sandwich', 
        hunger = {add = 45, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('homestyle_mac_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'homestyle_mac_cheese', 
        hunger = {add = 45, emote = 'beans', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('deluxe_chicken_royale', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'deluxe_chicken_royale', 
        hunger = {add = 45, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('fiery_premium_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fiery_premium_sandwich', 
        hunger = {add = 45, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_chicken_fingers', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_chicken_fingers', 
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_nuggets', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_nuggets', 
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('big_fish', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'big_fish',
        hunger = {add = 40, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('mini_chicken_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mini_chicken_sandwich',
        hunger = {add = 30, emote = 'burger', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('small_classic_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'small_classic_fries',
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('small_onion_rings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'small_onion_rings',
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('bs_mozzarella_sticks', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bs_mozzarella_sticks',
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cheddar_jalapeno_poppers', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheddar_jalapeno_poppers',
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cheese_stuffed_tater_tots', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheese_stuffed_tater_tots',
        hunger = {add = 20, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_fudge_cream_pie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_fudge_cream_pie',
        hunger = {add = 20, emote = 'xmasic', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('soft_serve_cone', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'soft_serve_cone',
        hunger = {add = 20, emote = 'icecreamh', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('soft_serve_cup', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'soft_serve_cup',
        hunger = {add = 20, emote = 'xmascc', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cookie_crumble_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cookie_crumble_shake',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_cookie_crumble_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_cookie_crumble_shake',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_shake',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('vanilla_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'vanilla_shake',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_shake',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_soda', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_soda',
        thirst = {add = 50, emote = 'soda', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('medium_light_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'medium_light_cola',
        thirst = {add = 50, emote = 'soda', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('bs_iced_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bs_iced_tea',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('medium_citrus_spark', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'medium_citrus_spark',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('medium_citrus_spark_zero', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'medium_citrus_spark_zero',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_Root_beer', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_Root_beer',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('sugar_free_root_beer', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sugar_free_root_beer',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('mellow_soda', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mellow_soda',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('medium_citrus_burst_soda', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'medium_citrus_burst_soda',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('bs_yello_mello', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bs_yello_mello',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('tropical_fruit_blast', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tropical_fruit_blast',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('refreshing_pink_lemonade', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'refreshing_pink_lemonade',
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('apple_juice_pouch', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'apple_juice_pouch',
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('apple_juice', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'apple_juice', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('decaf_brewed_coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'decaf_brewed_coffee', 
        thirst = {add = 50, emote = 'xmasmug2', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('plain_iced_coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'plain_iced_coffee', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('bs_orange_juice', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bs_orange_juice', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('bottle_light_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bottle_light_cola', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('junior_cheeseburger_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'junior_cheeseburger_combo', 
        hunger = {add = 40, emote = 'burger', delay = 20000},
        thirst = {add = 30, emote = 'drink', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('junior_chicken_nuggets_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'junior_chicken_nuggets_combo', 
        hunger = {add = 20, emote = 'sandwich', delay = 10000},
        thirst = {add = 30, emote = 'drink', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('junior_hamburger_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'junior_hamburger_combo', 
        hunger = {add = 30, emote = 'burger', delay = 15000},
        thirst = {add = 30, emote = 'drink', delay = 10000},
    })
end)

--=====================================================================Cluck-N-Bites=====================================================================--
QBCore.Functions.CreateUseableItem('chicken_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_biscuit', 
        hunger = {add = 40, emote = 'desert', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('brewed_iced_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'brewed_iced_tea', 
        thirst = {add = 60, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('grilled_egg_white_delight', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'grilled_egg_white_delight', 
        hunger = {add = 70, emote = 'desert', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('brown_scramble_burrito', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'brown_scramble_burrito', 
        hunger = {add = 80, emote = 'croissant', delay = 40000},
    })
end)

QBCore.Functions.CreateUseableItem('mini_chicken_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mini_chicken_bites', 
        hunger = {add = 60, emote = 'desert', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('brown_scramble_bowl', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'brown_scramble_bowl', 
        hunger = {add = 70, emote = 'beans', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_egg_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_egg_cheese', 
        hunger = {add = 60, emote = 'desert', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('sausage_egg_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sausage_egg_cheese', 
        hunger = {add = 70, emote = 'desert', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('egg_cheese_muffin', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'egg_cheese_muffin', 
        hunger = {add = 60, emote = 'desert', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('buttered_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'buttered_biscuit', 
        hunger = {add = 40, emote = 'beans', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('english_muffin', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'english_muffin', 
        hunger = {add = 40, emote = 'sandwich', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('greek_yogurt_parfait', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'greek_yogurt_parfait', 
        hunger = {add = 50, emote = 'xmasic', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('fruit_cup', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fruit_cup', 
        hunger = {add = 30, emote = 'xmasic', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_sandwich', 
        hunger = {add = 60, emote = 'burger', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('deluxe_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'deluxe_sandwich', 
        hunger = {add = 70, emote = 'burger', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_club_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_club_sandwich', 
        hunger = {add = 80, emote = 'burger', delay = 40000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_chicken_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_chicken_bites', 
        hunger = {add = 50, emote = 'croissant', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('grilled_chicken_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'grilled_chicken_bites', 
        hunger = {add = 50, emote = 'desert', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_chicken_tenders', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_chicken_tenders', 
        hunger = {add = 60, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('chilled_chicken_wrap', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chilled_chicken_wrap', 
        hunger = {add = 70, emote = 'croissant', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('cobb_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cobb_salad', 
        hunger = {add = 60, emote = 'beans', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('zesty_southwest_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'zesty_southwest_salad', 
        hunger = {add = 50, emote = 'beans', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('fresh_harvest_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fresh_harvest_salad', 
        hunger = {add = 50, emote = 'beans', delay = 25000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_waffle_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_waffle_fries', 
        hunger = {add = 40, emote = 'croissant', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('side_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'side_salad', 
        hunger = {add = 20, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('mac_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mac_cheese', 
        hunger = {add = 40, emote = 'beans', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_noodle_soup', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_noodle_soup', 
        hunger = {add = 40, emote = 'beans', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_kale_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_kale_salad', 
        hunger = {add = 20, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('waffle_potato_chips', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'waffle_potato_chips', 
        hunger = {add = 40, emote = 'sandwich', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('apple_sauce', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'apple_sauce', 
        thirst = {add = 10, emote = 'cup', delay = 5000},
    })
end)

QBCore.Functions.CreateUseableItem('frozen_citrus_smoothie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'frozen_citrus_smoothie', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('frosted_coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'frosted_coffee', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_chunk_cookie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_chunk_cookie', 
        hunger = {add = 30, emote = 'gingerbread', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_fudge_brownie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_fudge_brownie', 
        hunger = {add = 30, emote = 'icecreamb', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('peach_milkshake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'peach_milkshake', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cookies_cream_milkshake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cookies_cream_milkshake', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_milkshake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_milkshake', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_milkshake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_milkshake', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('vanilla_milkshake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'vanilla_milkshake', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('frozen_dream_cone', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'frozen_dream_cone', 
        thirst = {add = 30, emote = 'icecreamf', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('vanilla_dream_cup', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'vanilla_dream_cup', 
        thirst = {add = 20, emote = 'xmascc', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('citrus_refresh_lemonade', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'citrus_refresh_lemonade', 
        thirst = {add = 60, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('sweet_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sweet_tea', 
        thirst = {add = 60, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('dr_pepper', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'dr_pepper', 
        thirst = {add = 60, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('fresh_citrus_delight', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fresh_citrus_delight', 
        thirst = {add = 20, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_milk', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_milk', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'coffee', 
        thirst = {add = 30, emote = 'cocoa', delay = 15000},
    })
end)

--=====================================================================donutspot=====================================================================--
QBCore.Functions.CreateUseableItem('classic_morning_brew', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_morning_brew', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cold_brew', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cold_brew', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_dark_americano', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_dark_americano', 
        thirst = {add = 60, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('silky_smooth_latte', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'silky_smooth_latte', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('iced_classic_latte', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'iced_classic_latte', 
        thirst = {add = 50, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_cream_latte', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_cream_latte', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('velvet_layered_macchiato', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'velvet_layered_macchiato', 
        thirst = {add = 60, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('iced_macchiatto', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'iced_macchiatto', 
        thirst = {add = 50, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('iced_cappuccino', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'iced_cappuccino', 
        thirst = {add = 50, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('amber_brew_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'amber_brew_tea', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('fruit_sparkler', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fruit_sparkler', 
        thirst = {add = 60, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('iced_matcha_latte', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'iced_matcha_latte', 
        thirst = {add = 60, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('bacon_egg_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bacon_egg_cheese', 
        hunger = {add = 70, emote = 'sandwich', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('sourdough_breakfast_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sourdough_breakfast_sandwich', 
        hunger = {add = 60, emote = 'sandwich', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('morning_wrap', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'morning_wrap', 
        hunger = {add = 50, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('hash_browns', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'hash_browns', 
        hunger = {add = 60, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_bacon_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_bacon_bites', 
        hunger = {add = 70, emote = 'sandwich', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('bagel_bites_duo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bagel_bites_duo', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('bagel_cream_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bagel_cream_cheese', 
        hunger = {add = 60, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('morning_muffins', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'morning_muffins', 
        hunger = {add = 50, emote = 'xmasic', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('golden_flake_croissant', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'golden_flake_croissant', 
        hunger = {add = 60, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('morning_rings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'morning_rings', 
        hunger = {add = 70, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mini_donut_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mini_donut_bites', 
        hunger = {add = 50, emote = 'xmasic', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('packaged_coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'packaged_coffee', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('packaged_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'packaged_tea', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

--=====================================================================McDonald's=====================================================================--
QBCore.Functions.CreateUseableItem('spicy_crispy_chicken_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spicy_crispy_chicken_sandwich', 
        hunger = {add = 45, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('double_stack_deluxe', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_stack_deluxe', 
        hunger = {add = 70, emote = 'burger', delay = 35000},
    })
end)

QBCore.Functions.CreateUseableItem('golden_crispy_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'golden_crispy_fries', 
        hunger = {add = 20, emote = 'sandwich', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('quarter_beef_burger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'quarter_beef_burger', 
        hunger = {add = 45, emote = 'burger', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('sunrise_muffin', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sunrise_muffin', 
        hunger = {add = 20, emote = 'sandwich', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('sausage_burrito', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sausage_burrito', 
        hunger = {add = 40, emote = 'sandwich', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('double_beef_supreme', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_beef_supreme', 
        hunger = {add = 60, emote = 'burger', delay = 30000},
    })
end)

QBCore.Functions.CreateUseableItem('double_stack_deluxe_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_stack_deluxe_combo', 
        hunger = {add = 90, emote = 'burger', delay = 45000},
        thirst = {add = 50, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('double_quarter_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'double_quarter_combo', 
        hunger = {add = 70, emote = 'burger', delay = 35000},
        thirst = {add = 50, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_combo_chicken', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_combo_chicken', 
        hunger = {add = 50, emote = 'sandwich', delay = 25000},
        thirst = {add = 50, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('egg_cheese_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'egg_cheese_biscuit', 
        hunger = {add = 40, emote = 'sandwich', delay = 20000},
        thirst = {add = 40, emote = 'soda', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('deluxe_crispy_sandwich_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'deluxe_crispy_sandwich_combo', 
        hunger = {add = 60, emote = 'burger', delay = 30000},
        thirst = {add = 50, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('spicy_chicken_sandwich_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spicy_chicken_sandwich_combo', 
        hunger = {add = 60, emote = 'burger', delay = 30000},
        thirst = {add = 40, emote = 'cocoa', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('nugget_kids', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'nugget_kids', 
        hunger = {add = 55, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('sausage_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sausage_biscuit', 
        hunger = {add = 45, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('hot_fudge_sundae', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'hot_fudge_sundae', 
        thirst = {add = 30, emote = 'xmasmug', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('quarter_beef_burger_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'quarter_beef_burger_cheese', 
        hunger = {add = 40, emote = 'burger', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_chicken_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_chicken_sandwich', 
        hunger = {add = 45, emote = 'sandwich', delay = 22000},
    })
end)

QBCore.Functions.CreateUseableItem('cheesy_burger_feast', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheesy_burger_feast', 
        hunger = {add = 80, emote = 'burger', delay = 40000},
        thirst = {add = 50, emote = 'soda', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_flurry_cookies', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_flurry_cookies', 
        hunger = {add = 40, emote = 'xmasic', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_flurry_candies', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_flurry_candies', 
        hunger = {add = 40, emote = 'xmasic', delay = 20000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_watermelon_slushie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_watermelon_slushie', 
        thirst = {add = 50, emote = 'coffee', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('tropical_mango_slushie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tropical_mango_slushie', 
        thirst = {add = 50, emote = 'coffee', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_cola', 
        thirst = {add = 50, emote = 'soda', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('pepper_twist_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pepper_twist_cola', 
        thirst = {add = 50, emote = 'cocoa', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('citrus_burst_soda', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'citrus_burst_soda', 
        thirst = {add = 50, emote = 'coffee', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('berry_sparkle_soda', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'berry_sparkle_soda', 
        thirst = {add = 50, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('tropical_island_punch', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tropical_island_punch', 
        thirst = {add = 50, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_fruit_punch', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_fruit_punch', 
        thirst = {add = 50, emote = 'coffee', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_iced_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_iced_tea', 
        thirst = {add = 50, emote = 'cocoa', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('orange_juice', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'orange_juice',
        thirst = {add = 50, emote = 'cup', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_cappuccino', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_cappuccino', 
        thirst = {add = 30, emote = 'xmasmug', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('light_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'light_cola', 
        thirst = {add = 50, emote = 'cocoa', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_hot_chocolate', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_hot_chocolate', 
        thirst = {add = 30, emote = 'xmasmug', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_iced_coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_iced_coffee', 
        thirst = {add = 50, emote = 'cocoa', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_vanilla_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_vanilla_shake', 
        thirst = {add = 30, emote = 'cocoa', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mc_strawberry_shake', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mc_strawberry_shake', 
        thirst = {add = 30, emote = 'cocoa', delay = 12000},
    })
end)

--=====================================================================Pearls=====================================================================--
QBCore.Functions.CreateUseableItem('chicken_caesar_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_caesar_salad', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('crab_legs_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crab_legs_meal', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('glazed_salmon', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'glazed_salmon', 
        hunger = {add = 50, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('gourmet_double_burger', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'gourmet_double_burger', 
        hunger = {add = 65, emote = 'burger', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('shrimp_alfredo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'shrimp_alfredo', 
        hunger = {add = 50, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('steak_and_lobster_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'steak_and_lobster_meal', 
        hunger = {add = 30, emote = 'sandwich', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('tilapia_fish_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tilapia_fish_meal', 
        hunger = {add = 50, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('crab_cakes', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crab_cakes', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('shrimp_and_crab_dip', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'shrimp_and_crab_dip', 
        hunger = {add = 60, emote = 'beans', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('lobster_bisque', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'lobster_bisque', 
        hunger = {add = 50, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('shells_clam_chowder', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'shells_clam_chowder', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('upeel_shrimp', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'upeel_shrimp', 
        hunger = {add = 60, emote = 'sandwich', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('fried_mushrooms', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fried_mushrooms', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('oysters_half_shell', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'oysters_half_shell', 
        hunger = {add = 20, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('tropical_chicken_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tropical_chicken_salad', 
        hunger = {add = 40, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('salmon_caesar_salad', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'salmon_caesar_salad', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('shrimp_pasta', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'shrimp_pasta', 
        hunger = {add = 70, emote = 'sandwich', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('baby_lobster_pasta', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'baby_lobster_pasta', 
        hunger = {add = 50, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('fried_scallops', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fried_scallops', 
        hunger = {add = 30, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('popcorn_shrimp', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'popcorn_shrimp', 
        hunger = {add = 30, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('md_ginger_ale', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'md_ginger_ale', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('md_seltzer_water', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'md_seltzer_water', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('luxury_sparkling_wine', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'luxury_sparkling_wine', 
        thirst = {add = 50, emote = 'cup', delay = 12000},
        stress = {remove = 20, emote = 'beer', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('cognac_shot', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cognac_shot', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
        stress = {remove = 20, emote = 'beer', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('tequila_lime_margarita', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tequila_lime_margarita', 
        thirst = {add = 20, emote = 'cup', delay = 10000},
        stress = {remove = 20, emote = 'beer', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('pearls_coffee', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pearls_coffee', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
        stress = {remove = 100},
    })
end)

QBCore.Functions.CreateUseableItem('spicy_cherry_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spicy_cherry_cola', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('citrus_spark', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'citrus_spark', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('medium_sweet_tea', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'medium_sweet_tea', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('citrus_splash_lemonade', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'citrus_splash_lemonade', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

--=====================================================================Taco=====================================================================--
QBCore.Functions.CreateUseableItem('classic_signature_chicken', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_signature_chicken', 
        hunger = {add = 70, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('nuggets_medium_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'nuggets_medium_combo', 
        hunger = {add = 50, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('tenders_medium_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tenders_medium_combo', 
        hunger = {add = 80, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('surf_turf_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'surf_turf_combo', 
        hunger = {add = 70, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('tenders_family_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tenders_family_meal', 
        hunger = {add = 70, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('regular_cajun_rice', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'regular_cajun_rice', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_bundle', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_bundle', 
        hunger = {add = 70, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_family_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_family_meal', 
        hunger = {add = 70, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_cheesecake_pie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_cheesecake_pie', 
        hunger = {add = 50, emote = 'cake', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('signature_chicken_box', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'signature_chicken_box', 
        hunger = {add = 80, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cajun_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cajun_fries', 
        hunger = {add = 60, emote = 'fries', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mashed_potatoes', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mashed_potatoes', 
        hunger = {add = 50, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mild_tenders_box', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mild_tenders_box', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mild_tenders_bundle', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mild_tenders_bundle', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
        thirst = {add = 50, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('red_beans_rice', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'red_beans_rice', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('regular_coleslaw', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'regular_coleslaw', 
        hunger = {add = 50, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('carte_biscuit', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'carte_biscuit', 
        hunger = {add = 40, emote = 'bread', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('bigger_family_feast', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bigger_family_feast', 
        hunger = {add = 40, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chilled_premium_lemonade', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chilled_premium_lemonade', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_lemonade', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_lemonade', 
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cinnamon_apple_pie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cinnamon_apple_pie', 
        hunger = {add = 70, emote = 'cake', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('nuggets_kids_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'nuggets_kids_meal', 
        hunger = {add = 60, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('nuggets_la_carte', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'nuggets_la_carte', 
        hunger = {add = 60, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mac_cheese_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mac_cheese_meal', 
        hunger = {add = 70, emote = 'beans', delay = 12000},
    })
end)

--=====================================================================Pearls=====================================================================--
QBCore.Functions.CreateUseableItem('cheesy_beef_nachos', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheesy_beef_nachos', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('supreme_taco_flatbread', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'supreme_taco_flatbread', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cheese_quesadilla', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheese_quesadilla', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cheesy_black_bean', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheesy_black_bean', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cheese_crunch_taco_wrap', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheese_crunch_taco_wrap', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_burrito', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_burrito', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('churros_dip', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'churros_dip', 
        hunger = {add = 60, emote = 'cake', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cinnamon_twists', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cinnamon_twists', 
        hunger = {add = 60, emote = 'cake', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('crunchy_wrap_supreme', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crunchy_wrap_supreme', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('fishtaco', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fishtaco', 
        hunger = {add = 60, emote = 'fish', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('fries_grande', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fries_grande', 
        hunger = {add = 60, emote = 'fries', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('quesadilla', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'quesadilla', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('spicy_chicken_burrito', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spicy_chicken_burrito', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('taco_regular', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'taco_regular', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('tacomeet', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tacomeet', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('fiery_lava_burrito', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fiery_lava_burrito', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('crunchytaco', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crunchytaco', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('soft_taco', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'soft_taco', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('supreme_crunch_taco', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'supreme_crunch_taco', 
        hunger = {add = 60, emote = 'taco', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_wrap_supreme_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_wrap_supreme_meal', 
        hunger = {add = 80, emote = 'taco', delay = 12000},
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cheesy_quesadilla_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheesy_quesadilla_bites', 
        hunger = {add = 80, emote = 'taco', delay = 12000},
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('supreme_taco_duo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'supreme_taco_duo', 
        hunger = {add = 80, emote = 'taco', delay = 12000},
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('spicy_burrito_fiesta', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spicy_burrito_fiesta', 
        hunger = {add = 80, emote = 'taco', delay = 12000},
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

--=====================================================================Wingstop=====================================================================--
QBCore.Functions.CreateUseableItem('triple_meal_deal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'triple_meal_deal', 
        hunger = {add = 80, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('bronless_meal_deal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bronless_meal_deal', 
        hunger = {add = 70, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('boneless_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'boneless_wings', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('buffalo_ranch_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'buffalo_ranch_fries', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('wing_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'wing_combo', 
        hunger = {add = 60, emote = 'croissant', delay = 12000},
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('classic_wings_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'classic_wings_combo', 
        hunger = {add = 70, emote = 'croissant', delay = 12000},
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('meal_for_two', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'meal_for_two', 
        hunger = {add = 50, emote = 'burger', delay = 12000},
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('party_pack', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'party_pack', 
        hunger = {add = 70, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('thigh_bites_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'thigh_bites_combo', 
        hunger = {add = 70, emote = 'croissant', delay = 12000},
        thirst = {add = 70, emote = 'cup', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('tender_pack', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'tender_pack', 
        hunger = {add = 70, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('group_pack', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'group_pack', 
        hunger = {add = 60, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('hundred_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'hundred_wings', 
        hunger = {add = 80, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_tender_combo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_tender_combo', 
        hunger = {add = 60, emote = 'croissant', delay = 12000},
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('crispy_tenders', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'crispy_tenders', 
        hunger = {add = 70, emote = 'croissant', delay = 12000},
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('thirty_crispy_tenders', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'thirty_crispy_tenders', 
        hunger = {add = 80, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('seasoned_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'seasoned_fries', 
        hunger = {add = 40, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('bites_group_pack', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bites_group_pack', 
        hunger = {add = 40, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('boneless_meal_deal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'boneless_meal_deal', 
        hunger = {add = 40, emote = 'croissant', delay = 10000},
        thirst = {add = 40, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('spicy_cajun_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spicy_cajun_fries', 
        hunger = {add = 50, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cajun_fried_corn', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cajun_fried_corn', 
        hunger = {add = 60, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('large_thigh_bites', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'large_thigh_bites', 
        hunger = {add = 60, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('cheese_fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheese_fries', 
        hunger = {add = 50, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chickenwings_dips', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chickenwings_dips', 
        hunger = {add = 50, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('chocolate_chunk_brownie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chocolate_chunk_brownie', 
        hunger = {add = 60, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('fresh_baked_rolls', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fresh_baked_rolls', 
        hunger = {add = 60, emote = 'burger', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('side_of_flavor', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'side_of_flavor', 
        hunger = {add = 20, emote = 'beans', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('veggie_sticks', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'veggie_sticks', 
        hunger = {add = 40, emote = 'sandwich', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('garlic_parm_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'garlic_parm_wings', 
        hunger = {add = 60, emote = 'croissant', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('hot_chicken_wrap', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'hot_chicken_wrap', 
        hunger = {add = 60, emote = 'sandwich', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('w_ice_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'w_ice_cola', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('apple_fizz', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'apple_fizz', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('slim_cola', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'slim_cola', 
        thirst = {add = 30, emote = 'cup', delay = 10000},
    })
end)

--=====================================================================Pizza Crust=====================================================================--
QBCore.Functions.CreateUseableItem('extra_vagan_pizza', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'extra_vagan_pizza', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('meat_pizza', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'meat_pizza', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('philly_cheese_steak', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'philly_cheese_steak', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('pacific_veggie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pacific_veggie', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('honolulu_hawaiian', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'honolulu_hawaiian', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('pizza_deluxe', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pizza_deluxe', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cali_chicken_bacon', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cali_chicken_bacon', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('buffalo_chicken', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'buffalo_chicken', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('ultimate_pepperoni', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'ultimate_pepperoni', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('memphis_bbq_chicken', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'memphis_bbq_chicken', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('wisconsin_cheese', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'wisconsin_cheese', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('spinach_feta', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'spinach_feta', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_habanero', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_habanero', 
        hunger = {add = 60, emote = 'pizzaslice', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('mediterranean_veggie', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mediterranean_veggie', 
        hunger = {add = 60, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('philly_cheese_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'philly_cheese_sandwich', 
        hunger = {add = 60, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_bacon_ranch', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_bacon_ranch', 
        hunger = {add = 60, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('italian_sandwich', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'italian_sandwich', 
        hunger = {add = 60, emote = 'sandwich', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('p_chicken_alfredo', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'p_chicken_alfredo', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('italian_sausage_marinara', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'italian_sausage_marinara', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_carbonara', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_carbonara', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('pasta_primavera', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pasta_primavera', 
        hunger = {add = 60, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('d_fruit_punch', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'd_fruit_punch', 
        thirst = {add = 50, emote = 'cup', delay = 10000},
    })
end)

--=====================================================================Aldentes=====================================================================--
QBCore.Functions.CreateUseableItem('buffalo_chicken_strips', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'buffalo_chicken_strips', 
        hunger = {add = 30, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('fried_calamari', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fried_calamari', 
        hunger = {add = 30, emote = 'donut', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fries', 
        hunger = {add = 30, emote = 'sandwich', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('meatball', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'meatball', 
        hunger = {add = 30, emote = 'macaroon', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('mozzarella_sticks', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mozzarella_sticks', 
        hunger = {add = 30, emote = 'croissant', delay = 15000},
    })
end)

QBCore.Functions.CreateUseableItem('vodka', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'vodka', 
        thirst = {add = 20, emote = 'beer', delay = 15000},
        stress = {remove = 20, emote = 'beer', delay = 15000},
    })
end)

--=====================================================================Craft Bar=====================================================================--
QBCore.Functions.CreateUseableItem('biscuits_gravy', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'biscuits_gravy', 
        hunger = {add = 50, emote = 'bread', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('breakfast_meal', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'breakfast_meal', 
        hunger = {add = 50, emote = 'burger', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('chicken_and_waffles', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'chicken_and_waffles', 
        hunger = {add = 50, emote = 'chicken', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('omlet', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'omlet', 
        hunger = {add = 50, emote = 'egg', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('shrimp_and_grits', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'shrimp_and_grits', 
        hunger = {add = 50, emote = 'fish', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_banana_crepes', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_banana_crepes', 
        hunger = {add = 50, emote = 'cake', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('strawberry_nutella_waffles', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'strawberry_nutella_waffles', 
        hunger = {add = 50, emote = 'cake', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('sweat_tea_sangria', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sweat_tea_sangria', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('latte', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'latte', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('mimosa', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'mimosa', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('pomegranate_mimosa', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'pomegranate_mimosa', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('red_wine_sangria', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'red_wine_sangria', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('roseymary_gin_fizz', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'roseymary_gin_fizz', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('sangria_lemonade', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'sangria_lemonade', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('vodka_tonic', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'vodka_tonic', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

QBCore.Functions.CreateUseableItem('water', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'water', 
        thirst = {add = 60, emote = 'cup', delay = 10000},
    })
end)

--=====================================================================Cluckin Bell=====================================================================--
QBCore.Functions.CreateUseableItem('asain_zest_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'asain_zest_wings', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('blazing_hot_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'blazing_hot_wings', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('bbq_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'bbq_wings', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('fries', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'fries', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('garlic_parmesan_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'garlic_parmesan_wings', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('korean_bbq_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'korean_bbq_wings', 
        hunger = {add = 50, emote = 'croissant', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('cheese_sauce', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'cheese_sauce', 
        hunger = {add = 20, emote = 'beans', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('lemon_pepper_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'lemon_pepper_wings', 
        hunger = {add = 50, emote = 'chicken', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('original_hot_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'original_hot_wings', 
        hunger = {add = 50, emote = 'chicken', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('rotisserie_wings', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'rotisserie_wings', 
        hunger = {add = 50, emote = 'chicken', delay = 12000},
    })
end)

QBCore.Functions.CreateUseableItem('water', function(source)
    TriggerClientEvent('ak47_qb_business:onEat', source, {
        item = 'water', 
        thirst = {add = 60, emote = 'water', delay = 10000},
    })
end)


RegisterNetEvent('ak47_qb_business:SetMetaData', function(type, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.SetMetaData(type, amount)
    if type == 'hunger' then
        TriggerClientEvent('hud:client:UpdateNeeds', source, amount, xPlayer.PlayerData.metadata.thirst)
    else
        TriggerClientEvent('hud:client:UpdateNeeds', source, xPlayer.PlayerData.metadata.hunger, amount)
    end
end)

