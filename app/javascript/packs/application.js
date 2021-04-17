import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
window.$ = require('jquery');
window.jQuery = window.$;

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', () => {
    $("[data-tooltip]").mousemove(function (eventObject) {
        let data_tooltip = $(this).attr("data-tooltip")
        $(".default-tooltip").text(data_tooltip).css({
            "top": eventObject.pageY + 5,
            "left": eventObject.pageX + 5
        }).show()
    }).click(function () {
        console.log(123)
    }).mouseout(function () {
        $(".default-tooltip").hide().text("").css({
            "top": 0,
            "left": 0
        })
    })
})