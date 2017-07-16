$(function() {
    $("form[name='user-modal-form']").validate({
        rules: {
            name: {
                required: true,
                minlength: 5
            },
            email: {
                required: true,
                email: true
            },
            company_id: {
                required: true,
            }
        },
        messages: {
            name: "Please enter your name",
            company: "Please select company",
            email: "Please enter a valid email address"
        },
        submitHandler: (form) => {
            let resp;
            switch ($('#userModal').attr('data-action')){
                case 'add':
                    resp = API.addUser(form);
                    break;
                case 'edit':
                    resp = API.editUser(form, $('#userModal').attr('data-id'));
                    break;
            }

            resp.done(() => {
                    $('#userModal').modal('toggle');
                    setTimeout(()=>{
                        $('#main-nav a[href="#users"]').trigger( "click" );
                    }, 200);
                }).fail(() => {
                    //TODO finish this
            })
        }
    });

    $("form[name='company-modal-form']").validate({
        // Specify validation rules
        rules: {
            name: {
                required: true,
                minlength: 3
            },
            quota: {
                number: true,
                required: true,
                min: 1,
                max: 9999999999999999999
            },
        },
        // Specify validation error messages
        messages: {
            name: "Please enter company name",
            quota: "Please select quota"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: (form) => {
            let resp;
            switch ($('#companyModal').attr('data-action')){
                case 'add':
                    resp = API.addCompany(form);
                    break;
                case 'edit':
                    resp = API.editCompany(form, $('#companyModal').attr('data-id'));
                    break;
            }

            resp.done(() => {
                $('#companyModal').modal('toggle');
                setTimeout(()=>{
                    $('#main-nav a[href="#companies"]').trigger( "click" );
                }, 200);
            }).fail(() => {
                //TODO finish this
            })
        }
    });
});
