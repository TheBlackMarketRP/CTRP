function Delay(ms) {
    return new Promise((res) => {
      setTimeout(res, ms)
    })
}

let config, CONFIG, currentPattern, currentColorPattern, currentLength, patternColorShowed = false, checked = [];

let currentData = {
    ["1"] : { //beard
        type: 0,
        texture: 0,
        color1: 0,
        color2: 0
    },
    ["2"] : { //hair
        type: 0,
        texture: 0,
        color1: 0,
        color2: 0
    }
}

let isMenuShowed = false;
let maxVariation = 0;
let IsConfirmMenuShowed = false;
let buyerID = null;

let animation = false

$( () => {
    $("#right").fadeOut();

    let closeAll = () => {
        if (!isMenuShowed) return false;
        fetch(`https://${GetParentResourceName()}/closeNuiAndFocus`, {method: 'POST',headers: {'Content-Type': 'application/json; charset=UTF-8'}}).then(resp => resp.json()).then( (resp) => {})

        $("#select-style").animate({left: "-100vw"}, 300);
        $(".container").fadeOut()
        $(".container").css("display", "none")
        $("body").css("display", "none")
        $("#right").fadeOut();

        isMenuShowed = false;
    }


    setComponent = (component, id, texture) => {
        fetch(`https://${GetParentResourceName()}/preview`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                component: component,
                id: id,
                texture: texture
            })
        })
    }

    setColor = (component, color1, color2) => {
        fetch(`https://${GetParentResourceName()}/preview`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                isColor: true,
                component: component,
                color1: color1,
                color2: color2
            })
        })
    }

    getComponentTexture = async (component, id) => {
        if (component != 1) { 
            fetch(`https://${GetParentResourceName()}/getComponentTexture`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify({
                    buyerID: buyerID != null ? buyerID : -1,
                    component: component,
                    id: id
                })
            }).then(resp => resp.json()).then(async data => {
                if (data > 1) {
                    $("#right").fadeIn();
                    $(".list2").empty();
                    for (let i = 0; i < data; i++) {
                        $(".list2").append(`<div class="element half-element ${currentData[component.toString()].texture == i ? ' selected' : ''}" component="${component}" list="list2" value="${i}" id="component2_${i}" style="opacity:0;background-image:url(./img/textureVariation/${i}.png); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;"></div>`);
                        $(`#component2_${i}`).animate({
                            opacity: 0.85
                        }, 100)
        
                        await Delay(70)
                    }
                } else {
                    $("#right").fadeOut();
                }
                
                animation = false
            });
        } else {
            animation = false
        }
    }

    getColors = async (component) => {
        animation = true
        $(".list").empty();
        for (let i = 0; i < config.colors; i++) {
            $(".list").append(`<div class="element ${currentData[component.toString()].color1 == i ? ' selected' : ''}" isColor="true" component="${component}" list="list" value="${i}" id="color_${i}" style="opacity:0;background-color:${config.colorsList[i]};"></div>`);
            $(`#color_${i}`).animate({
                opacity: 0.95
            }, 30)

            await Delay(20)
        }
    }

    getColors2 = async (component) => {
        $("#right").fadeIn();
        $(".list2").empty();
        for (let i = 0; i < config.colors; i++) {
            $(".list2").append(`<div class="element half-element ${currentData[component.toString()].color2 == i ? ' selected' : ''}" isColor="true" component="${component}" list="list2" value="${i}" id="color2_${i}" style="opacity:0;background-color:${config.colorsList[i]};"></div>`);
            $(`#color2_${i}`).animate({
                opacity: 0.95
            }, 30)

            await Delay(20)
        }

        animation = false
    }



    document.onkeydown = async (e) => {
        if (e.key == 'Escape') {

            if (IsConfirmMenuShowed) return showConfirmMenu(false);
            
            closeAll();
        }

        if (e.key == 'q') {
            if (animation) return false;

            let hair = $("#hair");
            let hair_color = $("#hair-color");
            let beard = $("#beard");
            let beard_color = $("#beard-color");
            if (hair.hasClass("lateral-selected")) {
                hair.removeClass("lateral-selected")
                beard_color.addClass("lateral-selected")
                selectCategoryBeardColor()
            } else if (hair_color.hasClass("lateral-selected")) {
                hair_color.removeClass("lateral-selected")
                hair.addClass("lateral-selected")
                selectCategoryHair();
            } else if (beard.hasClass("lateral-selected")) {
                beard.removeClass("lateral-selected")
                hair_color.addClass("lateral-selected")
                selectCategoryHairColor();
            } else if (beard_color.hasClass("lateral-selected")) {
                beard_color.removeClass("lateral-selected")
                beard.addClass("lateral-selected")
                selectCategoryBeard();
            }
        }

        if (e.key == 'e') {
            if (animation) return false;

            let hair = $("#hair");
            let hair_color = $("#hair-color");
            let beard = $("#beard");
            let beard_color = $("#beard-color");
            if (hair.hasClass("lateral-selected")) {
                hair.removeClass("lateral-selected")
                hair_color.addClass("lateral-selected")
                selectCategoryHairColor();
            } else if (hair_color.hasClass("lateral-selected")) {
                hair_color.removeClass("lateral-selected")
                beard.addClass("lateral-selected")
                selectCategoryBeard();
            } else if (beard.hasClass("lateral-selected")) {
                beard.removeClass("lateral-selected")
                beard_color.addClass("lateral-selected")
                selectCategoryBeardColor()
            } else if (beard_color.hasClass("lateral-selected")) {
                beard_color.removeClass("lateral-selected")
                hair.addClass("lateral-selected")
                selectCategoryHair();
            }
        }
        
    };


    let selectCategoryHair = async () => {
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].HAIR}`);
        $(".right .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].HAIR2}`);
        animation = true

        await Delay(70)
        for (let i = 0; i < config.hair; i++) {

            $(".list").append(`<div class="element ${currentData["2"].type == i ? ' selected' : ''}" list="list" component="2" value="${i}" id="component_${i}" style="opacity:0;background-image:url(./img/hair/${config.sex}${i + 1}.png);"></div>`);

            await $(`#component_${i}`).animate({
                opacity: 0.85
            }, 70)
        }

        $(".list2").empty();
        getComponentTexture(2, currentData["2"].type)
    }

    let selectCategoryHairColor = async () => {
        getColors(2);
        getColors2(2);
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].HAIR_COLOR}`);
        $(".right .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].HAIR_COLOR} 2`);
    }

    let selectCategoryBeard = async () => {
        $(".lateral-button.lateral-selected").removeClass("lateral-selected")
        $("#beard").addClass("lateral-selected")
        $(".list").empty();
        $(".list2").empty();
        $("#right").fadeIn();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].BEARD}`);
        $(".right .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].BEARD2}`);

        animation = true

        await Delay(70)
        for (let i = 0; i < config.beard; i++) {
            $(".list").append(`<div class="element ${currentData["1"].type == i ? ' selected' : ''}" list="list" component="1" value="${i}" id="component_${i}" style="opacity:0;background-image:url(./img/beard/${config.sex}${i + 1}.png);"></div>`);
            await $(`#component_${i}`).animate({
                opacity: 0.85
            }, 70)
        }
        
        for (let i = 0; i <= 10; i++) {
            $(".list2").append(`<div class="element half-element ${currentData["1"].texture == i ? ' selected' : ''}" component="1" list="list2" value="${i}" id="component2_${i}" style="opacity:0;background-image:url(./img/length/${i}.png); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;"></div>`);

            await $(`#component2_${i}`).animate({
                opacity: 0.85
            }, 70)
        }

        animation = false
    }

    let selectCategoryBeardColor = async () => {
        getColors(1);
        getColors2(1);
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].BEARD_COLOR}`);
        $(".right .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].BEARD_COLOR} 2`);
    }

    /**
     * @param {string} type - all or one
     * @param {boolean} val - show or hide
     */
    let showConfirmMenu = (val) => {
        if (val) $(".popup-confirm").fadeIn();
        else $(".popup-confirm").fadeOut();

        IsConfirmMenuShowed = val;
    }

    window.addEventListener('message', async (event) => {
        let data = event.data
        if (data.action == 'HANDS_CONFIGURATION') {
            if (data?.buyer) {
                buyerID = data.buyer
            }

            config = data.config;
            CONFIG = data.languagesConfig;


            currentData["1"].type = config.currentBeard1;
            currentData["1"].texture = config.currentBeard2;
            currentData["1"].color1 = config.currentBeard3;
            currentData["1"].color2 = config.currentBeard4;

            currentData["2"].type = config.currentHair1;
            currentData["2"].texture = config.currentHair2;
            currentData["2"].color1 = config.currentHair3;
            currentData["2"].color2 = config.currentHair4;

            //TRANSLATION
            $("#select-style").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].SELECT_STYLE}`);
            $("#Thumb p").html(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].FINGER_THUMB}`);
            $("#Index p").html(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].FINGER_INDEX}`);
            $("#Middle p").html(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].FINGER_MIDDLE}`);
            $("#Ring p").html(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].FINGER_RING}`);
            $("#Little p").html(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].FINGER_LITTLE}`);
            $(".apply-on-one p").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].APPLY_ON_ONE);
            $(".apply-on-all p").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].APPLY_ON_ALL);
            $(".confirm-apply-on-one-preview p").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CONFIRM);
            $(".confirm-apply-on-one-final p").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CONFIRM);
            $(".confirm-on-all p").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CONFIRM);
            $(".cancel p").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CANCEL);
            $(".popup-confirm .title").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CONFIRM_CHOISE);


            //INIZIALIZZAZIONE VARIABILI: 
            // currentData["2"].type = 0 --inizializzarle tutte
            currentPattern = "remove-pattern"
            currentLength = "short"   

            $("body").css("display", "block")
            $("#select-style").animate({left: "20px"}, 300);
            await Delay(300)
            $(".container").fadeIn()
            $(".container").css("display", "flex")
    
    
            //SCELTA DEFAULT (BACKGROUND-COLOR)
            selectCategoryHair();
    
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $("#hair").addClass("lateral-selected")

            isMenuShowed = true;
        }


        if (data.action == "JOB_CUSTOMER_CONFIG") {
            $("body").css("display", "block")
            $(".container").css("display", "none")

            isMenuShowed = true;
        }

        if (data.action == "END_ANIMATION") {
            animation = false
        }


        if (data.action == 'CLOSE_MENU') {
            closeAll();
        }
    })

    $(".turn-right").on("click", () => {
        if (animation) return;
        fetch(`https://${GetParentResourceName()}/turn`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                direction: "right"
            })
        })
    })

    $(".turn-left").on("click", () => {
        if (animation) return;
        fetch(`https://${GetParentResourceName()}/turn`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                direction: "left"
            })
        })
    })

    $(document).on("click", ".lateral-button", async (e) => {
        if (IsConfirmMenuShowed) return;
        if (animation) return;
        let selected = $(e.target).attr("id")

        
        if (selected == "hair") {
            selectCategoryHair();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        } else if (selected == "hair-color") {
            selectCategoryHairColor();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        } else if (selected == "beard"){
            selectCategoryBeard();
        } else {
            selectCategoryBeardColor();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        }
    })

    $(document).on("click", ".element", async (e) => {
        if (IsConfirmMenuShowed || animation) return;
        animation = true
        
        let currentList = $(e.target).attr("list")
        let currentComponent = $(e.target).attr("component");
        let isColor = $(e.target).attr("isColor");

        $(`.${currentList} .selected`).removeClass("selected")
        $(e.target).addClass("selected");

        if (currentList == "list2") {
            if (!isColor) {
                currentData[currentComponent].texture = $(e.target).attr("value");
                setComponent(parseInt(currentComponent), currentData[currentComponent].type, currentData[currentComponent].texture)    
            } else {
                currentData[currentComponent].color2 = $(e.target).attr("value");
                setColor(currentComponent, currentData[currentComponent].color1, currentData[currentComponent].color2)
            }
            animation = false
        }else {
            if (!isColor) {
                currentData[currentComponent].type = $(e.target).attr("value");
                if (currentComponent != "1") currentData[currentComponent].texture = 0;
                setComponent(parseInt(currentComponent), currentData[currentComponent].type, currentData[currentComponent].texture)
                getComponentTexture(parseInt(currentComponent), currentData[currentComponent].type)
            } else {
                currentData[currentComponent].color1 = $(e.target).attr("value");
                setColor(currentComponent, currentData[currentComponent].color1, currentData[currentComponent].color2)
                animation = false
            }
        }
    })

    $(document).on("click", ".close-all", async (e) => {
        if (animation) return;
        closeAll();
    })

    $(document).on("click", ".apply-on-all", async (e) => {
        if (animation) return;
        showConfirmMenu(true);
    })
    
    $(document).on("click", ".confirm-on-all", async (e) => {
        if (animation) return;
        fetch(`https://${GetParentResourceName()}/applyOnAll`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                data: currentData
            })
        }).then(resp => resp.json()).then(resp => {
            animation = true
        });

        showConfirmMenu(false);
    })

    $(document).on("click", ".cancel", async (e) => {
        if (animation) return;
        showConfirmMenu(false)
    })
})