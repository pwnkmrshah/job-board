jQuery(function($) {

      jQuery.validator.addMethod("creditcard",function (e, a, r) {return e.match(/^[0-9]{16}$/);},"Please enter valid card number")

      jQuery.validator.addMethod("valid_card",function (e,a) {return ($.payment.validateCardNumber(e))},"Please enter valid card number")

      jQuery.validator.addMethod("valid_expiry",function (e,a) {

        return ($.payment.validateCardExpiry($(document).find("#cc-exp").payment('cardExpiryVal')))},"Please enter valid expiry date")

      jQuery.validator.addMethod("format",function (e,a) {
        return e.match(/^(0[1-9]|10|11|12)([\s][/][\s])([1-2][0-9][0-9][0-9])$/)},"Please enter valid date format")

        jQuery.validator.addMethod("valid_cvv",function (e,a) {
          var cardType = $.payment.cardType($(document).find('.cc-number').val())
          return ($.payment.validateCardCVC(e,cardType))},"Please enter valid cvv")



      $(document).find('.cc-number').payment('formatCardNumber');
      $(document).find('.cc-exp').payment('formatCardExpiry');
      $(document).find('.cc-cvc').payment('formatCardCVC');

      $.fn.toggleInputError = function(erred) {
        this.parent('.form-group').toggleClass('has-error', erred);
        return this;
      };
      $(document).find('.cc-number').on('change',function(e){
        $(this).parent('.form-group').removeClass('has-error')
        var card_number = $(document).find('.cc-number').val();
        var cardType = $.payment.cardType(card_number);
        $(document).find('.cc-brand').text(cardType);
        check_type = (!$.payment.validateCardNumber($(document).find('.cc-number').val()))
        console.log(check_type == true)
        $(document).find('.cc-number').toggleInputError(check_type);

      })
      $(document).find('.cc-exp').on('change',function(e){
        $(this).parent('.form-group').removeClass('has-error')
        check_type = (!$.payment.validateCardExpiry($(document).find("#cc-exp").payment('cardExpiryVal')))
        $(document).find('.cc-exp').toggleInputError(check_type)

      })
      $(document).find('.cc-cvc').on('change',function(e){
        $(this).parent('.form-group').removeClass('has-error')
        var cardType = $.payment.cardType($(document).find('.cc-number').val())
        check_type = (!$.payment.validateCardCVC($(document).find("#cc-cvc").val(), cardType))
        $(document).find('.cc-cvc').toggleInputError(check_type);

      })



      function validate_card(){
        $(document).find("form#payment-form").validate({
            ignore: "",
            rules: {
                'card_number': {
                    required: true,
                    valid_card: true

                },
                'card_cvc': {
                    required: true,
                    digits: true,
                    minlength: 3,
                    maxlength: 3,
                    valid_cvv: true
                },
                'card_expiry_date': {
                    required: true,
                    valid_expiry: true,
                    format: true
                }
            },
            messages: {
                'card_number': {
                    required: "Please enter your number on the card",
                    valid_card: "Please enter valid card number"

                },
                'card_cvc': {
                    required: "Please enter a cvv",
                    digits: "Please enter the valid cvv",
                    minlength: "CVV should be of minimum 3 characters long",
                    maxlength: "CVV should be of maximum 3 characters long"
                },
                'card_expiry_date': {
                    required: "Please enter expiry month",
                    format: "Please enter in valid format"

                }

            }
        });
      }
      validate_card();
    $(document).on('click', '.make_stripe_payment', function(e) {

      e.preventDefault()
        var arr_dateText = $(document).find("#cc-exp").val().split("/");
        var card_number = $(document).find('.cc-number').val();
        var card_expiry_month = parseInt(arr_dateText[0].trim());
        if(arr_dateText != ""){
          var card_expiry_year = parseInt(arr_dateText[1].trim());
        }else{
          var card_expiry_year = ""
        }

        var card_cvc = $(document).find("#cc-cvc").val();

        if( $(document).find("form#payment-form").valid() && !$('.form-group').hasClass('has-error')){
          id = $("input[name=user_id]").val();
          paid_amount = $("input[name=paid_amount]").val();
          
            $(".make_stripe_payment").prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Please wait');
            $(".pay_with_stripe").prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Please wait');
           $.ajax({
              type:"POST",
              url: '/applicants/dashboard/'+id+'/subscription',
              crossDomain:'true',
              dataType: "json",
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
               },
              data: {card_number: card_number, exp_month: card_expiry_month, exp_year: card_expiry_year, cvc: card_cvc, paid_amount: paid_amount},
              success: function(response)
              {
                if (response.success)
                 {
                    location.reload();
                    alert(response.message)
                 }
                else{
                   alert('fail')
                 $(".make_stripe_payment").prop('disabled', false).html('Make Payment');
                }
              }
            })
          }
      })

    });
