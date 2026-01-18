let locales = {};
let mySuccessfulReferrals = 0;
let invLink = 'nui://ak47_qb_inventory/web/build/images/';
let rewardsData = [];

window.addEventListener('message', function(event) {
    const item = event.data;
    if (item.action === 'toggle') {
        invLink = event.data.invLink
        document.getElementById('referralSystem').style.display = item.show ? 'block' : 'none';
    } else if (item.action === 'setData') {
        mySuccessfulReferrals = item.data.stats.successful;
        rewardsData = item.data.rewards;
        renderAll(item.data);
        if (item.starterPack && !item.data.hasUsedCode) {
            renderStarterPack(item.starterPack);
        }
    } else if (item.action === 'setLocale') {
        locales = item.locales;
        applyLocales();
    }
});

function post(url, data = {}) {
    return fetch(`https://${GetParentResourceName()}/${url}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(data)
    }).then(resp => resp.json());
}

function applyLocales() {
    document.getElementById('referral_system_title').innerText = locales.referral_system_title;
    document.getElementById('referral_system_desc').innerText = locales.referral_system_desc;
    document.getElementById('your_referral_code').innerText = locales.your_referral_code;
    document.getElementById('share_code_text').innerText = locales.share_code_text;
    document.getElementById('submit_a_code').innerText = locales.submit_a_code;
    document.getElementById('submit_code_desc').innerText = locales.submit_code_desc;
    document.getElementById('submitCodeInput').placeholder = locales.submit_code_placeholder;
    document.getElementById('submit_button').innerText = locales.submit_button;
    document.getElementById('your_stats').innerText = locales.your_stats;
    document.getElementById('successful_referrals').innerText = locales.successful_referrals;
    document.getElementById('pending_referrals').innerText = locales.pending_referrals;
    document.getElementById('next_reward_in').innerText = locales.next_reward_in;
    document.getElementById('referral_progress_title').innerText = locales.referral_progress_title;
    document.getElementById('rewards_title').innerText = locales.rewards_title;
}

function renderAll(data) {
    document.getElementById('referralCode').innerText = data.referralCode;
    document.getElementById('submitCodeCard').style.display = data.hasUsedCode ? 'none' : 'flex';
    renderStats(data.stats, data.rewards);
    renderReferrals(data.referrals);
    renderRewards(data.rewards);
}

function renderStarterPack(pack) {
    const container = document.getElementById('starterPackContainer');
    if (!container || !Array.isArray(pack) || pack.length === 0) return;

    container.innerHTML = '';
    let packHTML = '';
    const formatNumber = (num) => num >= 1000 ? `${(num / 1000).toFixed(1).replace('.0', '')}k` : num;

    pack.forEach(item => {
        const imageSrc = item.type === 'item' ? `${invLink}${item.name}.png` : `images/${item.name}.png`;
        let itemContentHTML = `<img src="${imageSrc}" alt="${item.label}" class="max-h-12 max-w-12 object-contain" onerror="this.onerror=null; this.outerHTML='<div class=\\'flex flex-col items-center justify-center text-purple-300\\'><i class=\\'fas fa-box-open text-2xl\\'></i><span class=\\'font-bold mt-1 text-white text-xs\\'>${item.label.toUpperCase()}</span></div>'"/>`;

        packHTML += `
            <div class="relative">
                <div class="w-20 h-20 rounded-md border-2 border-purple-400/50 bg-[#1a1a2e] flex flex-col justify-center items-center p-1">
                    ${itemContentHTML}
                </div>
                <span class="absolute bottom-0 right-0 bg-black/70 text-white text-xs font-bold px-1.5 py-0.5 rounded-tl-md rounded-br-md">x${formatNumber(item.amount)}</span>
            </div>`;
    });
    
    container.innerHTML = packHTML;
}

function renderStats(stats, rewards) {
    document.getElementById('statsSuccessful').innerText = stats.successful;
    document.getElementById('statsPending').innerText = stats.pending;
    
    const nextUnclaimedReward = rewards.find(r => !r.claimed && r.requires > mySuccessfulReferrals);
    let nextRewardInCount = nextUnclaimedReward ? Math.max(0, nextUnclaimedReward.requires - mySuccessfulReferrals) : 0;
    document.getElementById('statsNextReward').innerText = nextRewardInCount > 0 ? `${nextRewardInCount} ${locales.referrals_unit}` : locales.all_unlocked;
}

function renderReferrals(referrals) {
    const list = document.getElementById('referralList');
    const sortedReferrals = referrals
        .filter(ref => ref.status)
        .sort((a, b) => {
            const aIsCompleted = a.status === 'Completed';
            const bIsCompleted = b.status === 'Completed';
            if (aIsCompleted !== bIsCompleted) return aIsCompleted ? 1 : -1;
            return b.playtime - a.playtime;
        });

    if (sortedReferrals.length === 0) {
        list.innerHTML = `<p class="text-gray-400 text-center col-span-full">${locales.no_pending_referrals || 'No referrals in progress.'}</p>`;
        return;
    }
    const allItemsHTML = sortedReferrals.map(ref => {
        const percentage = Math.min(100, Math.round((ref.playtime / ref.goal) * 100));
        return `
            <div class="glass-card p-4 rounded-lg border-l-4 border-cyan-500">
                <div class="flex items-center justify-between mb-2">
                    <span class="font-semibold">${ref.name}</span>
                    <span class="text-xs font-bold text-cyan-400">${ref.status !== 'Completed' ? locales.status_in_progress : locales.status_completed}</span>
                </div>
                <div class="progress-bar-container w-full rounded-full h-2.5">
                    <div class="progress-bar h-2.5 rounded-full" style="width: ${percentage}%"></div>
                </div>
                <div class="text-right text-xs text-gray-400 mt-1">${(locales.playtime_text).replace('%s', ref.playtime).replace('%s', ref.goal)}</div>
            </div>`;
    }).join('');
    list.innerHTML = allItemsHTML;
}

function renderRewards(rewards) {
    const list = document.getElementById('rewardList');
    list.innerHTML = '';
    if (!rewards || !Array.isArray(rewards)) return;

    let rewardIndex = 0;
    rewards.forEach(reward => {
        rewardIndex++;
        const canClaim = mySuccessfulReferrals >= reward.requires;
        const isClaimed = reward.claimed;
        
        let rewardImageContent = '';
        switch (reward.type) {
            case 'item':
                rewardImageContent = `<img src="${invLink}${reward.name}.png" alt="${reward.label}" class="max-h-full max-w-full object-contain" onerror="this.onerror=null; this.outerHTML='<i class=\\'fas fa-gift text-5xl text-cyan-300\\'></i>';">`;
                break;
            case 'plate':
            case 'vehicle':
            case 'money':
                rewardImageContent = `<img src="images/${reward.name}.png" alt="${reward.label}" class="max-h-full max-w-full object-contain" onerror="this.onerror=null; this.outerHTML='<i class=\\'fas fa-gift text-5xl text-cyan-300\\'></i>';">`;
                break;
            default:
                rewardImageContent = `<i class="fas fa-gift text-5xl text-cyan-300"></i>`;
        }
        
        const amountDisplay = (reward.amount > 1) ? `<span class="absolute bottom-1 right-1 bg-black/70 text-white text-sm font-bold px-2 py-0.5 rounded-md">x${reward.amount}</span>` : '';
        const requiresText = (locales.requires_text || 'Requires %s Referrals').replace('%s', reward.requires);
        const rewardLabel = reward.label || reward.name;

        let cardHTML = '';
        if (isClaimed) {
            const imageHTML = `<div class="relative"><div class="w-full h-[8.5rem] rounded-md mx-auto mb-2 bg-[#1a1a2e] flex justify-center items-center p-2">${rewardImageContent}</div>${amountDisplay}</div>`;
            cardHTML = `
                <div class="glass-card p-3 rounded-lg text-center relative">
                    ${imageHTML}
                    <p class="font-semibold text-sm h-[1.4rem] flex items-center justify-center">${rewardLabel}</p>
                    <p class="text-xs text-cyan-300 mt-1">${requiresText}</p>
                    <div class="claimed-overlay">
                        <i class="fas fa-check-circle mr-2"></i> ${locales.claimed_text || 'CLAIMED'}
                    </div>
                </div>`;
        } else if (canClaim) {
            const imageHTML = `<div class="relative"><div class="w-full h-[8.5rem] rounded-md mx-auto mb-2 bg-[#1a1a2e] flex justify-center items-center p-2">${rewardImageContent}</div>${amountDisplay}</div>`;
            cardHTML = `
                <div class="reward-card h-[13.3rem] group glass-card p-3 rounded-lg text-center relative overflow-hidden cursor-pointer" onclick="handleClaimAttempt('${rewardIndex}')">
                    <div class="transition-all duration-300 group-hover:scale-105 group-hover:blur-sm">
                        ${imageHTML}
                        <p class="font-semibold text-sm h-[1.4rem] flex items-center justify-center">${rewardLabel}</p>
                        <p class="text-xs text-cyan-300 mt-1">${requiresText}</p>
                    </div>
                    <div class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                       <button class="neon-button py-3 px-8 rounded-lg bg-green-500 hover:bg-green-400 text-white font-bold uppercase tracking-wider pointer-events-none">${locales.claim_button || 'CLAIM'}</button>
                    </div>
                </div>`;
        } else {
            const imageHTML = `
                <div class="relative">
                    <div class="w-full h-[8.5rem] rounded-md mx-auto mb-2 bg-[#1a1a2e] flex justify-center items-center p-2">${rewardImageContent}</div>
                    ${amountDisplay}
                    <div class="absolute top-1 right-1 bg-black/70 text-white w-7 h-7 flex items-center justify-center rounded-full">
                        <i class="fas fa-lock text-sm"></i>
                    </div>
                </div>`;
            cardHTML = `
                <div class="glass-card p-3 rounded-lg text-center">
                    ${imageHTML}
                    <p class="font-semibold text-sm h-[1.4rem] flex items-center justify-center">${rewardLabel}</p>
                    <p class="text-xs text-cyan-300 mt-1">${requiresText}</p>
                </div>`;
        }
        list.innerHTML += cardHTML;
    });
}

function handleClaimAttempt(rewardIndex) {
    const reward = rewardsData[rewardIndex - 1];
    if (reward && reward.type === 'plate') {
        promptForPlate(rewardIndex);
    } else {
        claimReward(rewardIndex);
    }
}

function promptForPlate(rewardIndex) {
    const modal = document.getElementById('plateModal');
    const input = document.getElementById('plateInput');
    const cancelBtn = document.getElementById('plateCancelBtn');
    const submitBtn = document.getElementById('plateSubmitBtn');

    input.value = '';
    modal.classList.remove('hidden');

    const handleInput = () => {
        // Simple real-time formatter for better UX
        let value = input.value.toUpperCase();
        value = value.replace(/\s\s+/g, ' '); // Prevent consecutive spaces
        input.value = value;
    };
    input.addEventListener('input', handleInput);

    const handleSubmit = () => {
        const plateValue = input.value.trim().toUpperCase();
        
        // This regex validates two possible formats:
        // 1. Exactly 6 to 8 alphanumeric characters with no spaces.
        // 2. Exactly 3 alphanumeric characters, a single space, and then 3 to 5 alphanumeric characters.
        const plateRegex = /^([A-Z0-9]{6,8}|[A-Z0-9]{3}\s[A-Z0-9]{3,4})$/;

        if (!plateRegex.test(plateValue)) {
            showToast(locales.invalid_plate_format || 'Invalid format. Use "ABC 123" or "ABCDEFGH".', 'error');
            return;
        }
        
        claimReward(rewardIndex, plateValue);
        cleanup();
    };

    const handleCancel = () => {
        cleanup();
    };
    
    const cleanup = () => {
        modal.classList.add('hidden');
        input.removeEventListener('input', handleInput);
        submitBtn.removeEventListener('click', handleSubmit);
        cancelBtn.removeEventListener('click', handleCancel);
    };

    submitBtn.addEventListener('click', handleSubmit);
    cancelBtn.addEventListener('click', handleCancel);
}


async function copyCode() {
    const code = document.getElementById('referralCode').innerText;
    const el = document.createElement("textarea");
    el.value = code;
    document.body.appendChild(el);
    el.select();
    document.execCommand("copy");
    document.body.removeChild(el);
    showToast(locales.code_copied, 'success');
}

async function submitCode() {
    const input = document.getElementById('submitCodeInput');
    const code = input.value.trim();
    if (!code) return showToast(locales.please_enter_code, 'error');
    
    const result = await post('submitCode', { code });
    if (!result) return;
    let message = locales[result.message] || result.message;
    if (result.success) {
        message = (locales.code_accepted || message);
        input.value = '';
    }
    showToast(message, result.success ? 'success' : 'error');
}

async function claimReward(rewardIndex, plate = null) {
    const payload = { rewardIndex };
    if (plate) {
        payload.plate = plate;
    }
    const result = await post('claimReward', payload);
    if (!result) return;
    let message = locales[result.message] || result.message;
    if (result.success && result.rewardName) {
        message = (locales.reward_claimed_success).replace('%s', result.rewardName);
    }
    showToast(message, result.success ? 'success' : 'error');
}

let toastTimeout;
function showToast(message, type = 'success') {
    const toast = document.getElementById('toast');
    toast.textContent = message;
    toast.className = `toast show ${type}`;
    clearTimeout(toastTimeout);
    toastTimeout = setTimeout(() => { toast.classList.remove('show'); }, 5000);
}

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        const plateModal = document.getElementById('plateModal');
        if (!plateModal.classList.contains('hidden')) {
            plateModal.classList.add('hidden');
        } else {
            post('close');
        }
    }
});

function initializeImageTooltip() {
    const tooltip = document.getElementById('imageTooltip');
    if (!tooltip) return;
    const tooltipImage = document.getElementById('tooltipImage');
    const mainContainer = document.getElementById('referralSystem');
    let stillnessTimer;

    const positionTooltip = (e) => {
        let x = e.clientX + 15;
        let y = e.clientY + 15;
        if (x + tooltip.offsetWidth > window.innerWidth) x = e.clientX - tooltip.offsetWidth - 15;
        if (y + tooltip.offsetHeight > window.innerHeight) y = e.clientY - tooltip.offsetHeight - 15;
        tooltip.style.left = `${x}px`;
        tooltip.style.top = `${y}px`;
    };

    const hideTooltip = () => {
        clearTimeout(stillnessTimer);
        if (tooltip.style.display === 'block') tooltip.style.display = 'none';
    };

    mainContainer.addEventListener('mousemove', (e) => {
        hideTooltip();
        const target = e.target;
        if (target.tagName !== 'IMG') return;
        const isStarterPackItem = target.closest('#starterPackContainer');
        const isRewardItem = target.closest('#rewardList');
        if (isStarterPackItem || isRewardItem) {
            const imageSrc = target.src;
            const event = e;
            stillnessTimer = setTimeout(() => {
                tooltipImage.src = imageSrc;
                tooltip.style.display = 'block';
                positionTooltip(event);
            }, 500);
        }
    });
    mainContainer.addEventListener('mouseleave', hideTooltip);
}

initializeImageTooltip();