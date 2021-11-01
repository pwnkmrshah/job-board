// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require.context('../img', true)

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'

window.addEventListener('DOMContentLoaded', () => {
  $('.js-states').select2()
})


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
import "@fortawesome/fontawesome-free/js/all"
import 'bootstrap-icons/font/bootstrap-icons.css'


import "../stylesheets/application.scss" 
import "../scss/brands.scss" 
import "../scss/fontawesome.scss" 
import "../scss/regular.scss" 
import "../scss/solid.scss" 
import "../scss/v4-shims.scss" 

import "../stylesheets/animate.min.css"
import "../stylesheets/bootstrap.min.css"
import "../stylesheets/flaticon.css"
import "../stylesheets/magnific-popup.css"
import "../stylesheets/nice-select.css"
import "../stylesheets/fontawesome-all.min.css" 
import "../stylesheets/owl.carousel.min.css" 
import "../stylesheets/responsive.css" 
import "../stylesheets/slick.css" 
import "../stylesheets/slicknav.css" 
import "../stylesheets/style.css" 
import "../stylesheets/themify-icons.css" 

import "packs/jquery.payment.js" 
import "packs/stripe_validation.js" 
import "packs/animated.headline.js" 
import "packs/bootstrap.min.js" 
import "packs/contact.js" 
import "packs/jquery.ajaxchimp.min.js" 
import "packs/jquery.form.js" 
import "packs/jquery.magnific-popup.js" 
import "packs/jquery.nice-select.min.js" 
import "packs/jquery.paroller.min.js" 
import "packs/jquery.scrollUp.min.js" 
import "packs/jquery.slicknav.min.js" 
import "packs/jquery.sticky.js" 
import "packs/jquery.validate.min.js" 
import "packs/main.js" 
import "packs/mail-script.js" 
import "packs/one-page-nav-min.js" 
import "packs/owl.carousel.min.js" 
import "packs/plugins.js" 
import "packs/popper.min.js" 
import "packs/price_rangs.js" 
import "packs/slick.min.js" 
import "packs/wow.min.js" 


document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

