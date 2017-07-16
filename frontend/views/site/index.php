<?php
/* @var $this yii\web\View */
$this->title = 'VPN Management';
?>
<div class="main">
    <div class="row">
        <div class="col-lg-12">
            <ul id="main-nav" class="nav nav-tabs nav-justified">
                <li class="active">
                    <a data-toggle="tab" href="#users">
                        <i class="fa fa-user-o fa-2x" aria-hidden="true"></i>
                        Users
                    </a>
                </li>
                <li>
                    <a data-toggle="tab" href="#companies">
                        <i class="fa fa-building fa-2x" aria-hidden="true"></i>
                        Companies
                    </a>
                </li>
                <li>
                    <a data-toggle="tab" href="#abusers" style="color: #ff5e3c">
                           <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                        Abusers
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-ls-12">
            <div class="tab-content">
                <div id="users" class="tab-pane fade in active">
                    <h3>Users</h3>
                    <div class="loader">
                        <i class="fa fa-spinner fa-pulse fa-4x fa-fw" aria-hidden="true"></i>
                        <span class="sr-only">Loading...</span>
                    </div>
                    <div class="content"></div>
                </div>
                <div id="companies" class="tab-pane fade">
                    <h3>Companies</h3>
                    <div class="loader">
                        <i class="fa fa-spinner fa-pulse fa-4x fa-fw" aria-hidden="true"></i>
                        <span class="sr-only">Loading...</span>
                    </div>
                    <div class="content"></div>
                </div>
                <div id="abusers" class="tab-pane fade">
                    <h3>Abusers</h3>

                    <div class="row">
                        <div class="col-lg-12">
                            <label for="month-selector">
                                <select class="js-example-basic-single form-control" id="month-selector">
                                    <option value="1">January</option>
                                    <option value="2">February</option>
                                    <option value="3">March</option>
                                    <option value="4">April</option>
                                    <option value="5">May</option>
                                    <option value="6">June</option>
                                    <option value="7">July</option>
                                    <option value="8">August</option>
                                    <option value="9">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                </select>
                            </label>
                            <button class="btn btn-success report-btn" disabled="true">Show report</button>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="report-content-exceed"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="report-content"></div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <button class="btn btn-primary gen-btn">Generate data</button>
                            <span class="generate-label"></span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="generate-content"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" data-action=""
     data-id="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="userModalLabel"></h4>
            </div>
            <form id="userModalLabelForm" name="user-modal-form" method="post">

                <div class="modal-body">
                    <div class="form-group">
                        <label for="user-modal-name">Name</label>
                        <input type="text" class="form-control" name="name" id="user-modal-name">
                    </div>
                    <div class="form-group">
                        <label for="user-modal-email">Email:</label>
                        <input type="email" class="form-control" name="email" id="user-modal-email">
                    </div>
                    <div class="form-group">
                        <label for="userModalCompanySelect-selector"></label>
                        <select name="company_id" id="userModalCompanySelect-selector"></select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="userModalLabelActionButton"></button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="companyModal" tabindex="-1" role="dialog" aria-labelledby="companyModalLabel" data-action=""
     data-id="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="companyModalLabel"></h4>
            </div>
            <form id="companyModalForm" name="company-modal-form" method="post">

                <div class="modal-body">
                    <div class="form-group">
                        <label for="company-modal-name">Name</label>
                        <input type="text" class="form-control" name="name" id="company-modal-name">
                    </div>
                    <div class="form-group">
                        <label for="company-modal-quota">Quota:</label>
                        <input type="number" min="1" class="form-control" name="quota" id="company-modal-quota"
                               max="9999999999999999999">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="companyModalLabelActionButton"></button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="modalRemoveLabel" data-type=""
     data-id="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="userModalLabel">Do you wanna delete this </h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-danger" id="modalRemoveBtn">Delete</button>
            </div>
        </div>
    </div>
</div>
