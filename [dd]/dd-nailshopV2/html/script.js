function Delay(ms) {
    return new Promise((res) => {
        setTimeout(res, ms)
    })
}

let config, CONFIG, currentColor, currentPattern, currentColorPattern, currentLength, currentEffect, currentDecoration, currentDecorationColor, selectedHand, patternColorShowed = false, checked = [];
let IsConfirmMenuShowed = false;
let buyerID = null;

let animation = false, menuOpen = false;

let selectedFinger = { "Thumb": false, "Index": false, "Middle": false, "Ring": false, "Little": false };
let maxElementInMenu = 10;

$(() => {
    $(".changeHand").fadeOut();

    let closeAll = async () => {
        fetch(`https://${GetParentResourceName()}/closeNuiAndFocus`, { method: 'POST', headers: { 'Content-Type': 'application/json; charset=UTF-8' } }).then(resp => resp.json()).then((resp) => { })

        $("#select-style").animate({ left: "-100vw" }, 300);
        $("#select-hand").animate({ left: "-100vw" }, 300);
        $(".container").fadeOut()
        $(".background").fadeOut();
        $(".changeHand").fadeOut();
        await Delay(250)
        $(".container").css("display", "none")
        $("body").css("display", "none")

        menuOpen = false
    }

    $(document).keydown(async function (e) {
        if (e.key == 'Escape') {
            if (!menuOpen) return;
            if (animation) return;

            if (IsConfirmMenuShowed) {
                fetch(`https://${GetParentResourceName()}/reloadChanges`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({
                        buyerID: buyerID != null ? buyerID : -1,
                    })
                })

                showConfirmMenu("one", false);
                showConfirmMenu("all", false);

                return;
            }

            closeAll();
        }

        if (e.key == 'q' || e.key == 'e') {
            switchCategory(e.key);
        }
    });


    let controlsHoverSimultation = async (key) => {
        $("#" + key).addClass("selected");
        await Delay(200);
        $("#" + key).removeClass("selected");
    }

    let switchCategory = async (key) => {
        if (animation) return false;

        controlsHoverSimultation(key);

        if (key == 'q') {
            let color = $("#color");
            let effect = $("#effect");
            let pattern = $("#pattern");
            let pattern_color = $("#pattern-color");
            let decoration = $("#decoration");
            let decoration_color = $("#decoration-color");
            let length = $("#length");
            if (color.hasClass("lateral-selected")) {
                color.removeClass("lateral-selected")
                length.addClass("lateral-selected")
                selectCategoryLength()
            } else if (effect.hasClass("lateral-selected")) {
                effect.removeClass("lateral-selected")
                color.addClass("lateral-selected")
                selectCategoryBackground();
            } else if (pattern.hasClass("lateral-selected")) {
                pattern.removeClass("lateral-selected")
                effect.addClass("lateral-selected")
                selectCategoryEffect()
            } else if (pattern_color.hasClass("lateral-selected")) {
                pattern_color.removeClass("lateral-selected")
                pattern.addClass("lateral-selected")
                selectCategoryPattern();
            } else if (decoration.hasClass("lateral-selected")) {
                let result = await selectCategoryPatternColor(true)
                if (result == -2) {
                    decoration.removeClass("lateral-selected")
                    pattern.addClass("lateral-selected")
                    selectCategoryPattern();
                }
            } else if (decoration_color.hasClass("lateral-selected")) {
                decoration_color.removeClass("lateral-selected")
                decoration.addClass("lateral-selected")
                selectCategoryDecoration();
            } else if (length.hasClass("lateral-selected")) {
                let result = await selectCategoryDecorationColor(true)
                if (result == -2) {
                    length.removeClass("lateral-selected")
                    decoration.addClass("lateral-selected")
                    selectCategoryDecoration();
                }
            }
        } else if (key == 'e') {
            let color = $("#color");
            let pattern = $("#pattern");
            let pattern_color = $("#pattern-color");
            let decoration = $("#decoration");
            let decoration_color = $("#decoration-color");
            let length = $("#length");
            let effect = $("#effect");
            if (color.hasClass("lateral-selected")) {
                color.removeClass("lateral-selected")
                effect.addClass("lateral-selected")
                selectCategoryEffect();
            } else if (effect.hasClass("lateral-selected")) {
                effect.removeClass("lateral-selected")
                pattern.addClass("lateral-selected")
                selectCategoryPattern();
            } else if (pattern.hasClass("lateral-selected")) {
                let result = await selectCategoryPatternColor(true)
                if (result == -2) {
                    pattern.removeClass("lateral-selected");
                    decoration.addClass("lateral-selected");
                    selectCategoryDecoration();
                }
            } else if (pattern_color.hasClass("lateral-selected")) {
                pattern_color.removeClass("lateral-selected");
                decoration.addClass("lateral-selected");
                selectCategoryDecoration();
            } else if (decoration.hasClass("lateral-selected")) {
                let result = await selectCategoryDecorationColor(true)
                if (result == -2) {
                    decoration.removeClass("lateral-selected");
                    length.addClass("lateral-selected");
                    selectCategoryLength();
                }
            } else if (decoration_color.hasClass("lateral-selected")) {
                decoration_color.removeClass("lateral-selected");
                length.addClass("lateral-selected");
                selectCategoryLength();
            } else if (length.hasClass("lateral-selected")) {
                length.removeClass("lateral-selected")
                color.addClass("lateral-selected")
                selectCategoryBackground();
            }
        }
    }

    let setSelectedHand = (hand) => {
        $("#changeHand .arrow").removeClass("left-arrow");
        $("#changeHand .arrow").removeClass("right-arrow");
        $("#changeHand .arrow").addClass(hand + "-arrow");

        selectedHand = hand;
    }

    let selectCategoryBackground = async () => {
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].BACKGROUND}`);
        $(".list").append(`<div class="element background-color-element${currentColor == 'remove-color' ? ' selected' : ''}" id="remove-color" style="background-image: url(./img/icon_remove.png); background-size: 80%; background-position: 50% 50%; background-repeat: no-repeat;"></div>`);

        animation = true;

        $(`#remove-color`).animate({
            opacity: 1.0
        }, 55);

        await Delay(55);
        let currentID = -1;
        for (let i = 0; i < Object.entries(config).length; i++) {
            currentID++;
            for (const [k, v] of Object.entries(config)) {
                if (v.category == 0) {
                    if (v.id == currentID) {
                        let opacity = currentID < maxElementInMenu && '0' || '1.0';

                        if (!v.dlcAddon) {
                            $(".list").append(`<div class="element  background-color-element${currentColor == k ? ' selected' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(./img/bg_" + v.img + ".png); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}"></div>`);
                        } else {
                            $(".list").append(`<div class="element  background-color-element${currentColor == k ? ' selected' : ''}${v.locked ? ' locked' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(" + v.img + "); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}">${v.locked ? '<span class="tooltiptext">Click to buy</span>' : ''}</div>`);
                        }

                        if (currentID < maxElementInMenu) {
                            await $(`#${k}`).animate({
                                opacity: 1.0
                            }, 55)

                            await Delay(55)
                        }
                        break
                    }

                }
            }
        }

        animation = false
    }

    let selectCategoryEffect = async () => {
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].EFFECT}`);
        $(".list").append(`<div class="element effect-element${currentEffect == 'classic' ? ' selected' : ''}" id="classic" style="background-image: url(./img/icon_remove.png); background-size: 80%; background-position: 50% 50%; background-repeat: no-repeat;"></div>`);

        animation = true

        $(`#classic`).animate({
            opacity: 1.0
        }, 55)

        await Delay(55)
        let currentID = -1;
        for (let i = 0; i < Object.entries(config).length; i++) {
            currentID++;
            for (const [k, v] of Object.entries(config)) {
                if (v.category == 2) {
                    if (v.id == currentID) {
                        let opacity = currentID < maxElementInMenu && '0' || '1.0';

                        if (!v.dlcAddon) {
                            $(".list").append(`<div class="element effect-element${currentEffect == k ? ' selected' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(./img/bg_" + v.img + ".png); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}"></div>`);
                        } else {
                            $(".list").append(`<div class="element effect-element${currentEffect == k ? ' selected' : ''}${v.locked ? ' locked' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(" + v.img + "); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}">${v.locked ? '<span class="tooltiptext">Click to buy</span>' : ''}</div>`);
                        }

                        if (currentID < maxElementInMenu) {
                            await $(`#${k}`).animate({
                                opacity: 1.0
                            }, 55)

                            await Delay(55)
                        }
                        break
                    }

                }
            }
        }

        animation = false
    }

    let selectCategoryPattern = async () => {
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].PATTERN}`);
        $(".list").append(`<div class="element pattern-element${currentPattern == "remove-pattern" ? ' selected' : ''}" id="remove-pattern" style="background-image: url(./img/icon_remove.png); background-size: 80%; background-position: 50% 50%; background-repeat: no-repeat;"></div>`);

        animation = true

        await $(`#remove-pattern`).animate({
            opacity: 1.0
        }, 55)

        await Delay(55)

        let currentID = -1;
        for (let i = 0; i < Object.entries(config).length; i++) {
            currentID++;
            for (const [k, v] of Object.entries(config)) {
                if (v.category == 1) {
                    if (v.id == currentID) {
                        let opacity = currentID < maxElementInMenu && '0' || '1.0';

                        if (!v.dlcAddon) {
                            $(".list").append(`<div class="element pattern-element${currentPattern == k ? ' selected' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(./img/pattern_" + v.img + ".png); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}"></div>`);
                        } else {
                            $(".list").append(`<div class="element pattern-element${currentPattern == k ? ' selected' : ''}${v.locked ? ' locked' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(" + v.img + "); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}">${v.locked ? '<span class="tooltiptext">Click to buy</span>' : ''}</div>`);
                        }

                        if (currentID < maxElementInMenu) {
                            await $(`#${k}`).animate({
                                opacity: 1.0
                            }, 55)

                            await Delay(55)
                        }
                        break
                    }
                }
            }
        }

        animation = false
    }

    let selectCategoryPatternColor = async (nomsg) => {
        if (currentPattern == "remove-pattern" || currentPattern == null) {
            if (!nomsg) {
                fetch(`https://${GetParentResourceName()}/notify`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({
                        msg: CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CANNOT_SELECT_PATTERN_COLOR
                    })
                })
            }

            return -2;
        }

        $(".lateral-button.lateral-selected").removeClass("lateral-selected")
        $("#pattern-color").addClass("lateral-selected")
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].PATTERN_COLOR}`);

        animation = true

        for (const [k, v] of Object.entries(config)) {
            if (k == currentPattern) {
                let currentID = -1;
                for (let i = 0; i < Object.entries(v.color).length; i++) {
                    currentID++;
                    for (const [y, z] of Object.entries(v.color)) {
                        if (z.id == currentID) {
                            let opacity = currentID < maxElementInMenu && '0' || '1.0';

                            $(".list").append(`<div class="element pattern-color-element${currentColorPattern == y ? ' selected' : ''}" id="${y}" style="opacity:${opacity};background-color:${z.color};"></div>`);

                            if (currentID < maxElementInMenu) {
                                await $(`#${y}`).animate({
                                    opacity: 1.0
                                }, 55)

                                await Delay(55)
                            }

                            break
                        }
                    }
                }
                break
            }
        }

        animation = false
    }

    let selectCategoryDecoration = async () => {
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].DECORATION}`);
        $(".list").append(`<div class="element decoration-element${currentDecoration == "remove-decoration" ? ' selected' : ''}" id="remove-decoration" style="background-image: url(./img/icon_remove.png); background-size: 80%; background-position: 50% 50%; background-repeat: no-repeat;"></div>`);

        animation = true

        await $(`#remove-decoration`).animate({
            opacity: 1.0
        }, 55)

        await Delay(55)

        let currentID = -1;
        for (let i = 0; i < Object.entries(config).length; i++) {
            currentID++;
            for (const [k, v] of Object.entries(config)) {
                if (v.category == 3) {
                    if (v.id == currentID) {
                        let opacity = currentID < maxElementInMenu && '0' || '1.0';

                        if (!v.dlcAddon) {
                            $(".list").append(`<div class="element decoration-element${currentDecoration == k ? ' selected' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(./img/decoration_" + v.img + ".png); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}"></div>`);
                        } else {
                            $(".list").append(`<div class="element decoration-element${currentDecoration == k ? ' selected' : ''}${v.locked ? ' locked' : ''}" id="${k}" style="opacity:${opacity};${v.img ? "background-image:url(" + v.img + "); background-size: 100%; background-position: 50% 50%; background-repeat: no-repeat;" : "background-color:" + v.color}">${v.locked ? '<span class="tooltiptext">Click to buy</span>' : ''}</div>`);
                        }

                        if (currentID < maxElementInMenu) {
                            await $(`#${k}`).animate({
                                opacity: 1.0
                            }, 55)

                            await Delay(55)
                        }

                        break
                    }
                }
            }
        }

        animation = false
    }

    let selectCategoryDecorationColor = async (nomsg) => {
        if (currentDecoration == "remove-decoration" || currentDecoration == null) {
            if (!nomsg) {
                fetch(`https://${GetParentResourceName()}/notify`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({
                        msg: CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].CANNOT_SELECT_DECORATION_COLOR
                    })
                })
            }

            return -2;
        }

        $(".lateral-button.lateral-selected").removeClass("lateral-selected")
        $("#decoration-color").addClass("lateral-selected")
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].DECORATION_COLOR}`);

        animation = true

        for (const [k, v] of Object.entries(config)) {
            if (k == currentDecoration) {
                let currentID = -1;
                for (let i = 0; i < Object.entries(v.color).length; i++) {
                    currentID++;
                    for (const [y, z] of Object.entries(v.color)) {
                        if (z.id == currentID) {
                            let opacity = currentID < maxElementInMenu && '0' || '1.0';

                            $(".list").append(`<div class="element decoration-color-element${currentDecorationColor == y ? ' selected' : ''}" id="${y}" style="opacity:${opacity};background-color:${z.color};"></div>`);

                            if (currentID < maxElementInMenu) {
                                await $(`#${y}`).animate({
                                    opacity: 1.0
                                }, 55)

                                await Delay(55)
                            }

                            break
                        }
                    }
                }
                break
            }
        }

        animation = false
    }

    let selectCategoryLength = async () => {
        $(".list").empty();
        $(".middle .title").text(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].LENGTH}`);
        $(".list").append(`<div class="element length-element${currentLength == 'short' ? ' selected' : ''}" id="short" style="opacity:0;background-image: url(./img/bg_short.png);"></div>`);

        animation = true

        await $(`#short`).animate({
            opacity: 1.0
        }, 55)

        await Delay(55)

        $(".list").append(`<div class="element length-element${currentLength == 'medium' ? ' selected' : ''}" id="medium" style="opacity:0;background-image: url(./img/bg_medium.png);"></div>`);

        await $(`#medium`).animate({
            opacity: 1.0
        }, 55)

        await Delay(55)

        $(".list").append(`<div class="element length-element${currentLength == 'long' ? ' selected' : ''}" id="long" style="opacity:0;background-image: url(./img/bg_long.png);"></div>`);

        await $(`#long`).animate({
            opacity: 1.0
        }, 55)

        await Delay(55)

        animation = false
    }

    /**
     * @param {string} type - all or one
     * @param {boolean} val - show or hide
     */
    let showConfirmMenu = (type, val) => {
        IsConfirmMenuShowed = val;

        if (val) $(".popup-confirm-" + type).fadeIn();
        else $(".popup-confirm-" + type).fadeOut();
    }

    window.addEventListener('message', async (event) => {
        let data = event.data

        if (data.action == 'OPEN_MENU') {
            menuOpen = true
        }

        if (data.action == 'HANDS_CONFIGURATION') {
            menuOpen = true
            animation = true;
            if (data?.buyer) {
                buyerID = data.buyer
            }
            $("body").css("display", "block")
            await $(".background").fadeIn();
            $("#B").css("left", (data.bCoords[0] * 100 - 2) + "%")
            $("#B").css("top", (data.bCoords[1] * 100) + "%")

            $("#C").css("left", (data.cCoords[0] * 100 - 2) + "%")
            $("#C").css("top", (data.cCoords[1] * 100) + "%")

            $("#D").css("left", (data.dCoords[0] * 100 - 2) + "%")
            $("#D").css("top", (data.dCoords[1] * 100) + "%")

            $("#B2").css("left", (data.b2Coords[0] * 100) + "%")
            $("#B2").css("top", (data.b2Coords[1] * 100) + "%")

            $("#C2").css("left", (data.c2Coords[0] * 100) + "%")
            $("#C2").css("top", (data.c2Coords[1] * 100) + "%")

            $("#D2").css("left", (data.d2Coords[0] * 100) + "%")
            $("#D2").css("top", (data.d2Coords[1] * 100) + "%")


            let yb = parseInt($("#B").css("top").slice(0, -2));
            let xc = parseInt($("#C").css("left").slice(0, -2));
            let yc = parseInt($("#C").css("top").slice(0, -2));
            let xd = parseInt($("#D").css("left").slice(0, -2));
            let yd = parseInt($("#D").css("top").slice(0, -2));

            let y2b = parseInt($("#B2").css("top").slice(0, -2));
            let x2c = parseInt($("#C2").css("left").slice(0, -2));
            let y2c = parseInt($("#C2").css("top").slice(0, -2));
            let x2d = parseInt($("#D2").css("left").slice(0, -2));
            let y2d = parseInt($("#D2").css("top").slice(0, -2));

            config = data.config;
            CONFIG = data.languagesConfig;
            $('div.hand').remove();
            $("body").append(`<div class="hand" id="right" style="cursor:pointer; position:fixed; width: ${xd - xc + 20}px; height: ${yb - yc + 20}px; top: ${yd}px; left: ${xc + 20}px;"></div>`);
            $("body").append(`<div class="hand" id="left" style="cursor:pointer; position:fixed; width: ${x2c - x2d + 20}px; height: ${y2b - y2c + 20}px; top: ${y2d}px; left: ${x2d - 10}px;"></div>`);
            $("#select-hand").animate({ left: "20px" }, 300);

            //TRANSLATION
            $("#select-hand").html(`${CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].SELECT_HAND}`);
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
            currentColor = "remove-color";
            currentPattern = "remove-pattern";
            currentDecoration = "remove-decoration";
            currentLength = "short";
            currentEffect = "classic";

            animation = false;
        }


        if (data.action == 'CLOSE_MENU') {
            closeAll();
        }
    })

    $(document).on("click", ".hand", async (e) => {
        $(".hand").remove();
        $("#select-hand").animate({ left: "-100vw" }, 500);
        await Delay(300)
        $("#select-style").animate({ left: "20px" }, 300);

        $(".container").fadeIn()
        $(".container").css("display", "flex")

        fetch(`https://${GetParentResourceName()}/selectHand`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                target: buyerID != null ? buyerID : -1,
                selected: $(e.target).attr("id")
            })
        }).then(resp => resp.json()).then((resp) => {
            setSelectedHand(resp)

            //SCELTA DEFAULT (BACKGROUND-COLOR)
            selectCategoryBackground()

            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $("#color").addClass("lateral-selected")

            $(".changeHand").fadeIn()
        });
    })


    $(document).on("click", ".lateral-button", async (e) => {
        if (IsConfirmMenuShowed) return;
        if (animation) return;
        let selected = $(e.target).attr("id")


        if (selected == "color") {
            selectCategoryBackground();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        } else if (selected == "pattern") {
            selectCategoryPattern();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        } else if (selected == "pattern-color") {
            selectCategoryPatternColor();
        } else if (selected == "decoration") {
            selectCategoryDecoration();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        } else if (selected == "decoration-color") {
            selectCategoryDecorationColor();
        } else if (selected == "length") {
            selectCategoryLength();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        } else if (selected == "effect") {
            selectCategoryEffect();
            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $(e.target).addClass("lateral-selected")
        }
    })


    $(document).on("click", ".controls", async (e) => {
        switchCategory($(e.target).attr("id"));
    })

    $(document).on("click", ".background-color-element", async (e) => {
        if (IsConfirmMenuShowed) return;
        $(".background-color-element.selected").removeClass("selected")
        $(e.target).addClass("selected");
        currentColor = $(e.target).attr("id");
    })

    $(document).on("click", ".pattern-element", async (e) => {
        if ($(e.target).hasClass("locked")) return;
        if (IsConfirmMenuShowed) return;

        $(".pattern-element.selected").removeClass("selected")
        $(e.target).addClass("selected")

        currentPattern = $(e.target).attr("id");

        for (const [k, v] of Object.entries(config)) {
            if (k == currentPattern) {
                for (let i = 0; i < Object.entries(v.color).length; i++) {
                    for (const [y, z] of Object.entries(v.color)) {
                        if (z.id == 0) {
                            currentColorPattern = y;
                            break
                        }
                    }
                }
                break
            }
        }

    })

    $(document).on("click", ".pattern-color-element", async (e) => {
        $(".pattern-color-element.selected").removeClass("selected")
        $(e.target).addClass("selected")
        currentColorPattern = $(e.target).attr("id");
    })

    $(document).on("click", ".decoration-element", async (e) => {
        if ($(e.target).hasClass("locked")) return;
        if (IsConfirmMenuShowed) return;

        $(".decoration-element.selected").removeClass("selected")
        $(e.target).addClass("selected")

        currentDecoration = $(e.target).attr("id");


        for (const [k, v] of Object.entries(config)) {
            if (k == currentDecoration) {
                for (let i = 0; i < Object.entries(v.color).length; i++) {
                    for (const [y, z] of Object.entries(v.color)) {
                        if (z.id == 0) {
                            currentDecorationColor = y;
                            break
                        }
                    }
                }
                break
            }
        }
    })

    $(document).on("click", ".decoration-color-element", async (e) => {
        $(".decoration-color-element.selected").removeClass("selected")
        $(e.target).addClass("selected")
        currentDecorationColor = $(e.target).attr("id");
    })

    $(document).on("click", ".length-element", async (e) => {
        if (IsConfirmMenuShowed) return;

        $(".length-element.selected").removeClass("selected")
        $(e.target).addClass("selected")

        currentLength = $(e.target).attr("id");
    })

    $(document).on("click", ".effect-element", async (e) => {
        if ($(e.target).hasClass("locked")) return;
        $(".effect-element.selected").removeClass("selected")
        $(e.target).addClass("selected")
        currentEffect = $(e.target).attr("id");
    })

    $(document).on("click", ".finger-element", async (e) => {
        if (IsConfirmMenuShowed) return;

        let finger = $(e.target).attr("id");
        let classList = $(e.target).attr('class').split(/\s+/);
        let found = false
        for (let i = 0; i < classList.length; i++) {
            if (classList[i] == "selected") {
                found = true
            }
        }

        if (found) {
            selectedFinger[finger] = false;
            $(e.target).removeClass("selected")
        } else {
            selectedFinger[finger] = true;
            $(e.target).addClass("selected")
        }
    })

    $(document).on("click", ".apply-on-one", async (e) => {
        $(".left").fadeIn();
        $(".left .title").text(CONFIG.LANGUAGES[CONFIG.CURRENT_LANG].SELECT_NAILS);
        $(".finger-element").removeClass("selected");
        selectedFinger = { "Thumb": false, "Index": false, "Middle": false, "Ring": false, "Little": false };
    })

    $(document).on("click", ".close-left", async (e) => {
        $(".left").fadeOut();
        $(".finger-element").removeClass("selected");
        selectedFinger = { "Thumb": false, "Index": false, "Middle": false, "Ring": false, "Little": false };
    })

    $(document).on("click", ".close-all", async (e) => {
        if (IsConfirmMenuShowed) return;
        closeAll();
    })


    $(document).on("click", ".confirm-apply-on-one-preview", async (e) => {
        if (IsConfirmMenuShowed) return;

        showConfirmMenu("one", true);

        $(".left").fadeOut();

        fetch(`https://${GetParentResourceName()}/previewOne`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                selected: selectedFinger,
                selectedHand: selectedHand,
                nailsColor: currentColor,
                nailPattern: currentPattern,
                nailPatternColor: currentColorPattern,
                nailDecoration: currentDecoration,
                nailDecorationColor: currentDecorationColor,
                length: currentLength,
                effect: currentEffect
            })
        })

    })

    $(document).on("click", ".apply-on-all", async (e) => {
        if (IsConfirmMenuShowed) return;

        showConfirmMenu("all", true);

        fetch(`https://${GetParentResourceName()}/previewAll`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                selectedHand: selectedHand,
                nailsColor: currentColor,
                nailPattern: currentPattern,
                nailPatternColor: currentColorPattern,
                nailDecoration: currentDecoration,
                nailDecorationColor: currentDecorationColor,
                length: currentLength,
                effect: currentEffect
            })
        })
    })


    $(document).on("click", ".confirm-apply-on-one-final", async (e) => {

        $(".left").fadeOut();

        fetch(`https://${GetParentResourceName()}/applyOnSome`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                selected: selectedFinger,
                selectedHand: selectedHand,
                nailsColor: currentColor,
                nailPattern: currentPattern,
                nailPatternColor: currentColorPattern,
                nailDecoration: currentDecoration,
                nailDecorationColor: currentDecorationColor,
                length: currentLength,
                effect: currentEffect
            })
        })

        showConfirmMenu("one", false);
    })


    $("#changeHand").on("click", async () => {
        if (IsConfirmMenuShowed) return;
        if (animation) return;

        fetch(`https://${GetParentResourceName()}/selectHand`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                target: buyerID != null ? buyerID : -1,
                selected: selectedHand == "right" ? "left" : "right"
            })
        }).then(resp => resp.json()).then((resp) => {
            setSelectedHand(resp)

            //SCELTA DEFAULT (BACKGROUND-COLOR)
            selectCategoryBackground()

            $(".lateral-button.lateral-selected").removeClass("lateral-selected")
            $("#color").addClass("lateral-selected")
        });
    })


    $(document).on("click", ".confirm-on-all", async (e) => {

        fetch(`https://${GetParentResourceName()}/applyOnAll`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
                selectedHand: selectedHand,
                nailsColor: currentColor,
                nailPattern: currentPattern,
                nailPatternColor: currentColorPattern,
                nailDecoration: currentDecoration,
                nailDecorationColor: currentDecorationColor,
                length: currentLength,
                effect: currentEffect
            })
        })

        showConfirmMenu("all", false);
    })

    $(document).on("click", ".cancel", async (e) => {
        fetch(`https://${GetParentResourceName()}/reloadChanges`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                buyerID: buyerID != null ? buyerID : -1,
            })
        })

        showConfirmMenu("one", false)
        showConfirmMenu("all", false)
    })

    $(document).on("click", ".locked", async (e) => {
        window.invokeNative('openUrl', config[$(e.target).attr("id")].redirectURL)
    })

})