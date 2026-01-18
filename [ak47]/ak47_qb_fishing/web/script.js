// script.js
document.addEventListener('DOMContentLoaded', () => {
    let imageLink = 'nui://ak47_qb_inventory/web/build/images/';
    let T = {}; // This object will hold all our translations

    // Helper function to get translated strings, supporting placeholders
    const translate = (key, ...args) => {
        let text = T[key] || `[${key}]`; // Fallback to key if not found
        if (args.length > 0) {
            args.forEach((arg) => {
                text = text.replace('%s', arg);
            });
        }
        return text;
    };

    // Function to apply translations to static elements with data-translate attribute
    const applyStaticTranslations = () => {
        document.querySelectorAll('[data-translate]').forEach(el => {
            const key = el.dataset.translate;
            el.textContent = translate(key);
        });
    };
    
    // UI elements
    const uiContainer = document.getElementById('ui-container');
    const playerNameEl = document.getElementById('player-name');
    const playerLevelEl = document.getElementById('player-level');
    const playerXpEl = document.getElementById('player-xp');
    const xpBarEl = document.getElementById('xp-bar');
    const shopContainer = document.getElementById('shop-items-container');
    const fishMarketContainer = document.getElementById('fish-market-container');

    // Prompt elements
    const promptContainer = document.getElementById('prompt-container');
    const promptTitle = document.getElementById('prompt-title');
    const promptInput = document.getElementById('prompt-input');
    const promptConfirm = document.getElementById('prompt-confirm');
    const promptCancel = document.getElementById('prompt-cancel');
    let promptCallback = null;

    // Function to post data back to Lua
    const post = (url, data = {}) => {
        return fetch(`https://ak47_qb_fishing/${url}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=UTF-8' },
            body: JSON.stringify(data)
        });
    };
    
    // Replaces the default prompt with a custom modal
    const showAmountPrompt = (title, callback) => {
        promptTitle.textContent = title;
        promptInput.value = "1";
        promptContainer.style.display = 'flex';
        promptCallback = callback;
    };

    const closePrompt = () => {
        promptContainer.style.display = 'none';
        promptCallback = null;
    }

    promptConfirm.addEventListener('click', () => {
        const amount = Number(promptInput.value);
        if (promptCallback && !isNaN(amount) && amount > 0) {
            promptCallback(amount);
        }
        closePrompt();
    });

    promptCancel.addEventListener('click', closePrompt);

    const updateUI = (data) => {
        playerNameEl.textContent = data.playerName;
        playerLevelEl.textContent = `${translate('ui_level')} ${data.level}`;
        playerXpEl.textContent = `${data.xp} / ${data.nextLevelXp} ${translate('ui_xp')}`;
        xpBarEl.style.width = `${(data.xp / data.nextLevelXp) * 100}%`;

        shopContainer.innerHTML = '';
        fishMarketContainer.innerHTML = '';

        // Populate Shop
        const createShopItem = (item) => `
            <div class="glass-card2 interactive-card rounded-lg p-4 flex items-center justify-between">
                <div class="flex items-center space-x-4">
                     <img src="${imageLink + item.name + '.png'}" alt="${item.label}" class="w-16 h-16 object-contain rounded-md">
                    <div>
                        <h3 class="font-semibold text-lg">${item.label}</h3>
                        <p class="text-sm text-gray-300">${item.description}</p>
                    </div>
                </div>
                <button class="stylish-button buy-button w-[6rem]" data-item-name="${item.name}" data-item-label="${item.label}">$${item.price}</button>
            </div>`;

        data.shopItems.rods.forEach(item => shopContainer.innerHTML += createShopItem(item));
        data.shopItems.baits.forEach(item => shopContainer.innerHTML += createShopItem(item));

        // Populate Fish Market
        const fishArray = Object.entries(data.fishes);

        // Sort the fish array
        fishArray.sort(([nameA, fishA], [nameB, fishB]) => {
            const isLockedA = data.level < fishA.required_level;
            const isLockedB = data.level < fishB.required_level;

            if (isLockedA !== isLockedB) {
                return isLockedA ? 1 : -1; // Unlocked items first
            }
            
            // If both are locked or unlocked, sort by required level
            return fishA.required_level - fishB.required_level;
        });
        
        fishArray.forEach(([name, fish]) => {
            const hasAmount = data.fishCounts[name] || 0;
            const isLocked = data.level < fish.required_level;
            
            let buttonHtml = '';
            if (isLocked) {
                buttonHtml = `
                <button class="stylish-button" disabled>
                    ${translate('ui_unlock_at_level', fish.required_level)}
                </button>`;
            } else {
                buttonHtml = `
                <button class="stylish-button sell-button" data-fish-name="${name}" data-fish-amount="${hasAmount}" ${hasAmount > 0 ? '' : 'disabled'}>
                    ${translate('ui_sell')}
                </button>`;
            }

            const fishCard = `
            <div class="glass-card2 interactive-card rounded-lg p-4 text-center flex flex-col items-center">
                 <img src="${imageLink + name + '.png'}" alt="${fish.label}" class="w-32 h-32 object-contain rounded-md">
                <h3 class="font-bold text-lg mt-2">${fish.label}</h3>
                <p class="text-xl font-semibold text-[var(--accent-color-green)] mt-2">$${fish.sellprice}</p>
                <p class="text-sm text-gray-300 mt-1">${translate('ui_you_have', hasAmount)}</p>
                <div class="w-full mt-3">
                    ${buttonHtml}
                </div>
            </div>`;
            
            fishMarketContainer.innerHTML += fishCard;
        });
    };

    // Event Listeners for buttons
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('buy-button')) {
            const itemName = e.target.dataset.itemName;
            const itemLabel = e.target.dataset.itemLabel;
            showAmountPrompt(translate('ui_how_many', itemLabel), (amount) => {
                post('buyItem', { item: itemName, amount: amount });
            });
        }
        if (e.target.classList.contains('sell-button')) {
            const fishName = e.target.dataset.fishName;
            const fishAmount = e.target.dataset.fishAmount;
            post('sellFish', { fish: fishName, amount: fishAmount });
        }
    });

    // Listen for messages from Lua
    window.addEventListener('message', (event) => {
        const { action, data, translations } = event.data;
        if (action === 'show') {
            imageLink = event.data.invLink
            T = translations; // Store the translations
            updateUI(data);
            applyStaticTranslations(); // Apply translations to static elements
            uiContainer.style.display = 'flex';
        }
    });

    // Listen for Escape key to close
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            if (promptContainer.style.display === 'flex') {
                closePrompt();
            } else {
                uiContainer.style.display = 'none';
                post('close');
            }
        }
    });
});