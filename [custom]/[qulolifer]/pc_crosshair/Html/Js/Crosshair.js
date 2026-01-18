var currentSelectedCrosshair = 1; 

$(window).ready(function () {
    $.post(`https://${GetParentResourceName()}/loadCrosshair`, JSON.stringify({}));

    window.addEventListener('message', function (event) {
        if (event.data.curAction == 'open_menu') {
            $('#wrap').show();

            var crosshairs = event.data.crosshairs;

            generateCrosshairs(crosshairs, true); 
        }

        else if (event.data.curAction == 'load_crosshair') {
            currentSelectedCrosshair = event.data.crosshair_kvp;

            var imagePath = `./Images/Crosshairs/${currentSelectedCrosshair}.png`;
        
            document.getElementById('type').src = imagePath;
        }
        
        else if (event.data.curAction == 'display_crosshair') {
            event.data.boolean ? $('#type').show() : $('#type').hide();
        }
    });

    $('#btn-close').click(function () {
        $('#wrap').hide();

        $.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
    });

    document.onkeyup = function (event) {
        if (event.key == 'Escape') {
            $('#wrap').hide();

            $.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
        }
    };
});

function HideCross() {
	$('#type').hide();
}

function generateCrosshairs(crosshairs, isMenuOpen) {
    var ul = document.getElementById('crosshair-scrollable');

    ul.innerHTML = '';

    for (var i = 1; i <= crosshairs.length; i++) {
        var button = document.createElement('button');

        button.className = 'crosshair';

        button.title = `CROSSHAIR ${i}`;

        button.innerHTML = `<img src="./Images/Crosshairs/${i}.png"/><span class="crosshair-label">CROSSHAIR ${i}</span>`;

        if (isMenuOpen) {
            button.querySelector('.crosshair-label').style.display = 'none';
        }

        // button.addEventListener('mouseover', function () {
        //     var label = this.querySelector('.crosshair-label');
          
        //     label.style.display = 'block';
        // });

        // button.addEventListener('mouseout', function () {
        //     var label = this.querySelector('.crosshair-label');
         
        //     label.style.display = isMenuOpen ? 'none' : 'block'; 
        // });

        button.addEventListener('click', function () {
            var number = getCrosshairNumber(this);
          
            var imagePath = `./Images/Crosshairs/${number}.png`;
            
            document.getElementById('type').src = imagePath;

            $.post(`https://${GetParentResourceName()}/crosshair`, JSON.stringify({ number: number }));

            currentSelectedCrosshair = number
        });

        ul.appendChild(button);
    }

    var initialSelected = document.querySelector(`.crosshair img[src="./Images/Crosshairs/${currentSelectedCrosshair}.png"]`).parentNode;

    if (initialSelected) {
        initialSelected.classList.add('active-crosshair');
    }

    toggleCrosshair(document.querySelectorAll('.crosshair'));
}

function getCrosshairNumber(element) {
    var span = element.querySelector('span');

    var match = span.textContent.match(/\d+/);

    return match ? parseInt(match[0]) : null;
}

function toggleCrosshair(elem) {
    for (var i = 0; i < elem.length; i++) {
        elem[i].addEventListener('click', function (e) {
            var current = this;

            for (var i = 0; i < elem.length; i++) {
                if (current != elem[i]) {
                    elem[i].classList.remove('active-crosshair');
                } else {
                    if (!current.classList.contains('active-crosshair')) {
                        current.classList.add('active-crosshair');
                    }
                }
            }

            e.preventDefault();
        });
    }
}