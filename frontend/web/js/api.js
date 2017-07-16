API = {

    BASE_URL: 'http://api-testj.dev/',
    API_VERSION: 'v1',

    /*
     *  User actions
     */

    getURL: (link) => {
        return API.BASE_URL + API.API_VERSION + '/' + link;
    },

    getUserList: (callback) => {
        $.ajax({
            method: 'get',
            url: API.getURL('customers')
        })
        .done(function (data) {
            callback(data);
        })
        .fail(function () {
            callback(false);
        });
    },

    addUser: function (form) {
        return $.ajax({
            method: 'post',
            url: API.getURL('customers'),
            data: $(form).serialize()
        })
    },

    editUser: function (form, id) {
        return $.ajax({
            method: 'patch',
            url: API.getURL('customers/' +  id),
            data: $(form).serialize()
        })
    },

    deleteUser: function (id) {
        return $.ajax({
            method: 'delete',
            url: API.getURL('customers/' +  id),
        })
    },

    /*
    * Company
    */

    getCompanyList: (callback) => {
        return $.ajax({
            method: 'get',
            url: API.getURL('companies')
        })
            .done(function (data) {
                callback(data);
            })
            .fail(function () {
                callback(false);
            });
    },

    deleteCompany(id){
        return $.ajax({
            method: 'delete',
            url: API.getURL('companies/' +  id),
        })
    },

    addCompany(form){
        return $.ajax({
            method: 'post',
            url: API.getURL('companies'),
            data: $(form).serialize()
        })
    },

    editCompany(form, id){
        return $.ajax({
            method: 'patch',
            url: API.getURL('companies/' +  id),
            data: $(form).serialize()
        })
    },

    generateData: () => {
        return $.ajax({
            url: API.getURL('reports/generate')
        })
    },

    getReport: ($month) => {
        return $.ajax({
            url: API.getURL('reports/show/' + $month)
        })
    }
};