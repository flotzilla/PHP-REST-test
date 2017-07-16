APP = {
    currentTab: '#user',
};

$(document).ready(() => {
    console.debug("hello there");

    parseActiveTab(getActiveTab());
    componentHandler();
});


componentHandler = () => {
    // watch main nav panel state

    $('#main-nav > li').click(function (el) {
        //clear current tab
        $(APP.currentTab + '> div.content').html('');

        let target = $(el.target),
            href = '';
        if(target.is('a')){
            href = target.attr('href');
        }else{
            href = target.closest('a').attr('href');
        }

        $(href + '> div.content').html('');
        showLoader();
        parseActiveTab(href);

    });

    let monthSelector = $("#month-selector");
    monthSelector.select2({
        placeholder: 'select month to generate report',
        language: "en",
        width: 300
    });
    monthSelector.val(-1).trigger("change");
    monthSelector.on("select2:select", function (e) {
        $('.report-btn').removeAttr('disabled');
    });

    $('.report-btn').click(()=>{
        API.getReport(monthSelector.val())
            .done((resp) => {
                if(resp.status === 'ok'){
                    reportDrawCallback(resp)
                }else{
                    alert('Something goes wrong. Check console messages');
                    console.error(resp.message)
                }
            });
    });

    $('.gen-btn').click(() => {
        API.generateData()
            .done((response) => {
                if(response.status === 'ok'){
                    console.log(response);
                    generatetDrawCallback(response);
                }else{
                    alert('Something goes wrong. Check console messages');
                    console.error(response.message)
                }
            })
    });
};

dynamicComponentHandler = () => {

    // load user modal data
    $('.user-modal-btn').click((el) => {
        let params = $(el.target).data(),
            finalParams = {
                label: '',
                btnlabel: '',
                name: '',
                email: '',
                company: '',
            };

        switch (params.action){
            case 'edit':
                finalParams = {
                    label: 'Edit user',
                    btnlabel: 'Save',
                    name: params.data.name,
                    email: params.data.email,
                    company: params.data.company_id,
                };

                $('#userModal').attr('data-id', params.data.id);
                break;
            case 'add':
                finalParams = {
                        label: 'Create user',
                        btnlabel: 'Create',
                        name: '',
                        email: '',
                        company: 1,
                };
                break;
        }

        $('#userModal').attr('data-action', params.action);
        $('#userModalLabel').text(finalParams.label);
        $('#userModalLabelActionButton').text(finalParams.btnlabel);
        $('#userModalLabelForm input[name="name"]').val(finalParams.name);
        $('#userModalLabelForm input[name="email"]').val(finalParams.email);

        $.when(API.getCompanyList(() => {}))
            .done((data) => {
                $("#userModalCompanySelect-selector").select2({
                    language: "en",
                    width: 300,
                    data: $.map(data, (v) => { return {id: v.id, value: v.id, text: v.name}}),
                });

                $('#userModalCompanySelect-selector').val(finalParams.company).trigger("change");
            });
    });

    $('.company-modal-btn').click((el) => {
        let params = $(el.target).data(),
            finalParams = {
                label: '',
                btnlabel: '',
                name: '',
                quota: '',
            };

        switch (params.action){
            case 'edit':
                finalParams = {
                    label: 'Edit company',
                    btnlabel: 'Save',
                    name: params.data.name,
                    quota: params.data.quota,
                };

                $('#companyModal').attr('data-id', params.data.id);
                break;
            case 'add':
                finalParams = {
                    label: 'Create company',
                    btnlabel: 'Create',
                    name: '',
                    quota: 100000,
                };
                break;
        }

        $('#companyModal').attr('data-action', params.action);
        $('#companyModalLabel').text(finalParams.label);
        $('#companyModalLabelActionButton').text(finalParams.btnlabel);
        $('#companyModalForm input[name="name"]').val(finalParams.name);
        $('#companyModalForm input[name="quota"]').val(finalParams.quota);
    });

    $('.delete-btn').click((el)=>{
        let modal = $('#modalRemove'),
            target = $(el.target),
        type = target.data().type,
        id = target.closest('li').attr('data-id');
        modal.attr('data-type', target.data().type);
        modal.attr('data-id', target.closest('li').attr('data-id'));
        modal.find('.modal-title').text('Do you wanna delete this ' + type + '?');

        $('#modalRemoveBtn').click(()=>{
            let resp;
            switch (type) {
                case 'user':
                    resp = API.deleteUser(id).done(() => {
                        $('#modalRemove').modal('toggle');
                        $('#main-nav a[href="#users"]').trigger("click");
                    });
                    break;
                case 'company':
                    resp = API.deleteCompany(id).done(() => {
                        $('#modalRemove').modal('toggle');
                        $('#main-nav a[href="#companies"]').trigger("click");
                    });
                    break;
            }
        });
    });
};

getActiveTab = () => $('#main-nav > li.active > a').attr('href');

parseActiveTab = (activeHref) => {
    APP.currentTab = activeHref;
    switch (activeHref){
        case '#users':
            API.getUserList(userLoadCallback);
            break;
        case '#companies':
            API.getCompanyList(companyLoadCallback);
            break;
        case '#abusers':
            $('.report-content').html('');
            $("#month-selector").val(-1).trigger("change");
            $('.report-btn').attr('disabled', 'disabled');
            break;
    }
};

userLoadCallback = (data) => {
    hideLoader();
    let response = '';
    if(Array.isArray(data)){
        if(data.length > 0){
            response += "<ul class='list-format'>";
            $.each(data, function (indx, el) {
                response += `<li data-id="${el.id}">
                            # ${el.id} - 
                            <b>${el.name}</b> - ${el.email} - <i>${el.company.name}</i>
                            <a class="user-modal-btn" data-toggle="modal" data-target="#userModal" 
                                data-action="edit" data-data='${JSON.stringify(el)}'> [edit] </a>
                            <a class="delete-btn" data-toggle="modal" data-target="#modalRemove"
                             data-type="user">[remove] </a>
                        </li>`;
            });
            response += `</ul>
                <button class="btn btn-success user-modal-btn" data-toggle="modal" data-target="#userModal"
                data-action="add">Add user</button>`;
        }else{
            response = '<h2>No users yet</h2>'
        }
    }else{
        response = '<h2>Sorry, cannot load your data</h2>'
    }
    $('#users > div.content').html(response);
    dynamicComponentHandler();
};

companyLoadCallback = (data) => {
    hideLoader();
    let response = '';
    if(Array.isArray(data)){
        if(data.length > 0){
            response += "<ul class='list-format'>";
            $.each(data, (indx, el) => {
                response += `<li data-id="${el.id}">
                            # ${el.id} -  
                            <b>${el.name}</b> - ${UTILS.humanReadableFileSizeFormat(el.quota)}                         
                            <a class="company-modal-btn" data-toggle="modal" data-target="#companyModal" 
                                data-action="edit" data-data='${JSON.stringify(el)}'> [edit] </a>
                            <a class="delete-btn" data-toggle="modal" data-target="#modalRemove"
                             data-type="company">[remove] </a>
                        </li>`;
            });
            response += `</ul>
                    <button class="btn btn-success company-modal-btn" data-toggle="modal" data-target="#companyModal" 
                                data-action="add">Add company</button>`;
        }else{
            response = '<h2>No users yet</h2>'
        }
    }else{
        response = '<h2>Sorry, cannot load your data</h2>'
    }
    $('#companies > div.content').html(response);
    dynamicComponentHandler();
};

reportDrawCallback = (data) => {
  let containerExceeded = $('.report-content-exceed'),
      container = $('.report-content'),
      response = '';

  if(data.countExceed > 0){
      response +="<ul class='list-format'>";
      $.each(data.transfersExceed, function (indx, el) {
          response += `<li data-id="${el.id}">
                             # ${el.id} - <b>${el.name}</b> - ${UTILS.humanReadableFileSizeFormat(el.used)}  <i>
                            (${UTILS.humanReadableFileSizeFormat(el.quota)})</i> 
                            <span class="exceed">exceed</span>
                         </li>`;
      });
      response += `</ul>`;
  }else{
      response = `<h4>No data for exceeded companies</h4>`
  }
    containerExceeded.html(response);

    if(data.count > 0){
        response ="<ul class='list-format'>";
        $.each(data.transfers, function (indx, el) {
            response += `<li data-id="${el.id}">
                             <b>${el.name}</b> fits into their limit ${UTILS.humanReadableFileSizeFormat(el.used)}  <i>
                            (${UTILS.humanReadableFileSizeFormat(el.quota)})</i>          
                         </li>`;
        });
        response += `</ul>`;
    }else {
        response = `<h4>Companies did not exceed limits</h4>`
    }
    container.html(response);

};

generatetDrawCallback = (data) => {
    let label = $('.generate-label'),
        content = $('.generate-content'),
        response = "<ul class='list-format'>";

    label.html(data.message);
    $.each(data.data, function (indx, el) {
        response += `<li data-id="${el.id}">
                             # ${el.customer_id} - <b>${el.date}</b> - ${UTILS.humanReadableFileSizeFormat(el.transfered_bytes)}  <i>
                            (${el.url})</i>             
                         </li>`;
    });
    response += `</ul>`;

    content.html(response);
};

showLoader = () => {
    $('.loader').show();
};

hideLoader = () => {
    $('.loader').hide();
};