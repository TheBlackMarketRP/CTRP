// Written by UnLuckyLust ( © Dreams Weaver 2023-2025 ) | Download Free only at https://UnLuckyLust.tebex.io

$(document).ready(function() {
    const body = document.querySelector('body');

    const watermark = document.createElement('div');
    watermark.classList.add('watermark');

    const logo = document.createElement('img');
    logo.classList.add('logo');
    logo.src = './logo.png';
    
    const textContainer = document.createElement('div');
    textContainer.classList.add('text-container');
    const text = document.createElement('div');
    text.classList.add('name');

    textContainer.appendChild(text);
    watermark.appendChild(logo);
    watermark.appendChild(textContainer);
    body.appendChild(watermark);

    function WatermarkDisplay(bool) { watermark.style.display = bool ? 'flex' : 'none'; }
    WatermarkDisplay(false);
    
    function changeAnimation(animationType) {
        text.classList.remove('static', 'fade', 'glow', 'expand', 'typing', 'rgb');
        if (animationType) { text.classList.add(animationType) };
    };
    
    function updatePosition(position) {
        let selectedBox;
        if (typeof position === "string") {
            selectedBox = document.querySelector(`.position-box[data-pos="${position}"]`);
        } else {
            selectedBox = position;
        }
        if (!selectedBox) return;
        document.querySelectorAll(".position-box").forEach(box => box.classList.remove("active"));
        selectedBox.classList.add("active");
    }

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post("https://ull-watermark/exitUI", JSON.stringify({}))
            return
        }
    };
    
    const nameInput = document.getElementById("watermarkName");
    const imageInput = document.getElementById("watermarkImage");
    const animationSelect = document.getElementById("animationSelect");

    nameInput.addEventListener("input", function () {
        this.value = this.value.replace(/["'`\\]/g, "");
    });
    
    document.querySelectorAll(".position-box").forEach(box => {
        box.addEventListener("click", function () {
            updatePosition(this);
            const selectedPosition = this.getAttribute("data-pos");
            $.post("https://ull-watermark/watermarkPosition", JSON.stringify({
                position: selectedPosition
            }))
        });
    });
    
    window.addEventListener('message', function(event) {
        let data = event.data;
        
        if (data.type === "ull:watermark") {
            WatermarkDisplay(data.status === true);
        } else if (data.type === "ull:watermark:data") {
            logo.src = data.content.image;
            body.style.setProperty('--name', data.content.text);
            body.style.setProperty('--font-family', data.content.font);
            body.style.setProperty('--font-size', data.content.textScale);
            body.style.setProperty('--image-width', data.content.imageScale);
            body.style.setProperty('--bg', data.content.bg);
            body.style.setProperty('--text-color', data.content.textColor);
            body.style.setProperty('--color', data.content.color);
            body.style.setProperty('--dark-color', data.content.darkColor);
            changeAnimation(data.content.animation);
        } else if (data.type === "ull:watermark:position") {
            watermark.classList.remove('top-left', 'top-center', 'top-right', 'center-left', 'center', 'center-right', 'bottom-left', 'bottom-center', 'bottom-right', 'left-aligned', 'right-aligned');

            watermark.classList.add(data.location);
            
            if (watermark.classList.contains('top-left') || watermark.classList.contains('center-left') || watermark.classList.contains('bottom-left')) {
                watermark.classList.add('left-aligned');
            } else {
                watermark.classList.add('right-aligned');
            }
        } else if (data.type === "ull:watermark:settings") {
            body.style.setProperty('--ui-display', data.status ? 'flex' : 'none');
            const sanitizedText = data.text.replace(/["'`\\]/g, "");

            nameInput.value = sanitizedText;
            imageInput.value = data.image;
            animationSelect.value = data.animation;
            updatePosition(data.position);
        }
    });
    
    $("#toggleWatermark").click(function () {
        $.post("https://ull-watermark/toggleWatermark", JSON.stringify({}))
        return
    })

    $("#applyWatermark").click(function () {
        const content = {
            text: nameInput.value || false,
            image: imageInput.value || false,
            animation: animationSelect.value
        };
        $.post("https://ull-watermark/updateWatermark", JSON.stringify(content))
        return
    })
    
    $("#exitUI").click(function () {
        $.post("https://ull-watermark/exitUI", JSON.stringify({}))
        return
    })
});
