<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show-records.aspx.cs" Inherits="public_records.show_records" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Winston-Salem State University Public Records</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>
     <link href="css/bootstrap.min.css" rel="stylesheet" />
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    
    <script src="//code.jquery.com/jquery-1.12.3.js" type="text/javascript"></script>
    <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="//momentjs.com/downloads/moment-with-locales.js" type="text/javascript"></script>

      
    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'server-process.aspx',
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    $('#public-records').dataTable({
                        data: data,
                        columns: [
                           //{"data" : "Id"},
                             { // render
                                 "data": function (data, type, row, meta) {
                                     return '<a href="get-record.aspx?getID=' + data.Id + '">' + data.Id + '</a>';
                                 }
                             },
                            {'data':'request_name'},                     
                            { 'data': 'request_organization' },
                            { 'data': 'request_department' },
                           // {'data': 'descriptions' },
                            {
                             'data': function (data, type, full) {
                                 return (data.fullfill_date) ? moment(data.fullfill_date).format('MM/DD/YYYY') : '';
                              }

                            },
                             {
                                 'data': function (data, type, full) {
                                     return (data.last_modified) ? moment(data.last_modified).format('MM/DD/YYYY') : '';
                                 }

                             },
                              {
                                  'data': function (data, type, full) {
                                      return (data.created_date) ? moment(data.created_date).format('MM/DD/YYYY') : '';
                                  }

                              },
                           
                        ]
                    });
                    }
                });
            });
                //"ajax":"https://datatables.net/examples/server_side/scripts/server_processing.php"
        </script>

     <style>
        @media screen and (min-width: 992px) {
            #headerTitle {
                margin-top: 30px;
                float: right;
            }
       }

         @media screen and (max-width: 992px) {
            #headerTitle {
                 float: left;
            }
       }

         .dataTables_wrapper {
            margin-top:30px;
         }
    </style>

</head>
<body>
    <form id="form1" runat="server">
          <div class="container" style="margin-top: 10px; margin-bottom: 10px; border: solid 0px black">
           <div id="headerContainer">
                <img style="float:left" src="images/wssu-logo.jpg" alt="WSSU logo"/>  
           </div>
           <div id="headerTitle">
               <h2>Public Records Requests</h2>
           </div>         
       </div>

       <hr style="width: 100%; border-bottom: 3px solid #D50032; margin-top: 0px;" />
    
     <div class="container" style="background-color:silver;">
     <div class="jumbotron" style="margin-top:30px; margin-bottom :20px;font-size:16px" >
         <p style="font-size:16px">As a public institution in North Carolina, the University is subject to the laws and policies of the federal government, the State of North Carolina, and the University of North Carolina system. </p>
<p style="font-size:16px">We respond as promptly as possible to public records requests while protecting the privacy rights of our students and employees, as well as other information that is confidential under federal and state laws. </p>
<p style="font-size:16px">We process requests as promptly as possible. However, because of the increasingly large volume of requests and a legal obligation to review each and every page to protect confidential information, it often takes time before we can begin to process a new request. The broader and vaguer the request (e.g. “all documents” on a topic or “all emails” with certain search terms for multiple people during a period of several months or even years), the longer it takes to collect potentially responsive records. Other factors include the number of other requests – and the volume of responsive records – for requests ahead of yours that are currently in process. We ask you to be as exact as possible about the records you seek. </p>
<p style="font-size:16px">To revise a request already submitted, please send an email with amendments to <a href="mailto:publicrecords@wssu.edu">publicrecords@wssu.edu</a> and reference the assigned ID number.</p>      
<a class="btn btn-primary pull-right" href="application.aspx" role="button">Submit New Request</a>
     </div>
    <div class="table-responsive">
     <table class="table row-border stripe" id="public-records" cellspacing="0" width="100%" style="padding-top:30px; padding-bottom :20px; ">
        <thead style="white-space: nowrap;">
            <tr>
                <th>ID</th>
                <th>Request Name</th>
                <th>Organization</th>
                <th>WSSU Dept.</th>   
                <th>Resolved Date</th>
                <th>Last Modified</th>
                 <th>Receive Date</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Request Name</th>
                <th>Organization</th>
                <th>WSSU Dept.</th>               
                <th>Resolved Date</th>
                <th>Last Modified</th>
                 <th>Receive Date</th>
            </tr>
        </tfoot>
    </table>	
    </div>
    </div>
    <br/>
    </form>
    <br/>
 
</body>
</html>
