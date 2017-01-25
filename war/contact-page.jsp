<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Contact Book | index.html</title>
    <meta charset="utf-8" />
    
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="assets/css/material-kit.css" title="alternate 1" >
  <link rel="stylesheet" href="assets/css/css3.css" title="alternate 2" >  
  <link rel="stylesheet" href="assets/css/css4.css" title="alternate 3" >  
  <link rel="stylesheet" href="assets/css/css5.css" title="alternate 4" >  
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>
    
    <script src="assets/js/assets.js"></script>
    <script type="text/javascript" src="assets/js/styleswitcher.js"></script>
    
    <body>
    <div id="page_wrap">
	
		
	
	<div id="navbar-full">
    <div id="navbar">
     
        <nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
          
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-brand-logo" href="#">
                  
                    <div class="brand"> Contact Book </div>
              </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="javascript:void(0);" data-toggle="search" class="hidden-xs">
                            <i class="pe-7s-search"></i>
                            <p>Search</p>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#/new">
                            <i class="pe-7s-plus"></i>
                            <p>AddNew</p>
                        </a>
                    </li>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                      <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="pe-7s-user"></i>
                                <p> Theme</p>
                            </a>
                          <ul class="dropdown-menu">
                          <li>	
		<a href="#" onclick="setActiveStyleSheet('default'); return false;">defult</a> 
		 </li><li class="divider"></li>
		 <li><a href="#" onclick="setActiveStyleSheet('alternate 1'); return false;">css 2</a></li>
		<li class="divider"></li> <li><a href="#" onclick="setActiveStyleSheet('alternate 2'); return false;">css 3</a></li>
		
	<li class="divider"></li>	  <li><a href="#" onclick="setActiveStyleSheet('alternate 3'); return false;">css 4</a></li>
	<li class="divider"></li>	  <li><a href="#" onclick="setActiveStyleSheet('alternate 4'); return false;">css 5</a></li>
                                                    </ul>
                    </li>
               
                    
                    
                    
                    
                    
                    <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="pe-7s-user"></i>
                                <p> Account</p>
                            </a>
                          <ul class="dropdown-menu">
                          <li>	
	 <li><a href="#/profile">Profile</a></li>
                            <li class="divider"></li>
                            <li><a href="Contact/Logout">Logout</a></li>
                          </ul>
                    </li>
               </ul>
               <form class="navbar-form navbar-right navbar-search-form" role="search" id="live-search">                  
                 <div class="form-group">
                 <fieldset>
                      <input type="text" value="" class="form-control" placeholder="Search..." id="filter">
                      <span id="filter-count"></span>
                    </fieldset>
                 </div> 
              </form>
              
            </div>
          </div>
        </nav>
      
    </div>
</div> 





        <div class="container" id="container">

            <div class="row" style="">
                <div class="col-md-12" id="primary-content" style="margin-top:100px">
                </div>

            </div>
        </div>

        <!-- THE JAVASCRIPT TEMPLATES -->
        <!-- the form, used for create and edit -->

        <script type="text/jst" id="formTemplate">
            <div class="well" style="margin-top:10px;box-shadow:0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;" div="scroll">
                <div class="alert alert-danger fade in" style="display:none;margin-top:10px;box-shadow:0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;"></div>
                <form class="add-entry">
                    <div class="form-group">
                        <label>name:</label>
                        <input type="text" class="form-control" name="name" value="" id="name" required placeholder="name Here" />
                        <input type="hidden" name="Id" id="Id" />
                    </div>
                    <div class="form-group">
                        <label>number:</label>
                            <div class="controls">
                            <input type="number" class=" form-control" name="number" id="number" min="2000-01-01" max="today" required/>
                            </div>
                    </div>
                    <div class="form-group">
                        <label>mail:</label>
                        <input type="email" class="form-control" name="mail" rows="15" id="mail" placeholder="Enter Your mail"></input>
                    </div>
                    <button class="save btn btn-large btn-info" type="submit" style="font-size:20px;"><i class="fa fa-floppy-o"></i></button>
                    <a href="#" class="btn btn-large btn-default" style="font-size:20px;"><i class="fa fa-times"></i></a>
                </form>
            </div>
        </script>

        <script type="text/jst" id="editTemplate">
            <div class="well" style="margin-top:10px;box-shadow:0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;" div="scroll">
                <div class="alert alert-danger fade in" style="display:none;margin-top:10px;box-shadow:0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;"></div>
                <form class="add-entry">
                    <div class="form-group">
                        <label>name:</label>
                        <input type="text" class="form-control" name="name" value="<@= contact.get('name') @>" id="name" required placeholder="name Here" />
                        <input type="hidden" name="id" value="<@= contact.get('id') @>" id="id" />
                        <input type="hidden" name="Id" id="Id" />
                    </div>
                    <div class="form-group">
                        <label>number :</label>
                        
                            <input type="number" class=" form-control" name="number" value="<@= contact.get('number') @>" id="number" min="2000-01-01" />

                    </div>
                    <div class="form-group">
                        <label>mail:</label>
						
                        <input class="form-control" name="mail" rows="15" id="mail" value="<@=  contact.get('mail') @>" placeholder="Enter Your mail">
                            
                       </input>	
                         </div>
                    

                     <button class="save btn btn-large btn-info" type="submit" style="font-size:20px;"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span></button>
                    <a href="#" class="btn btn-large btn-default" style="font-size:20px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </form>
            </div>
        </script>


        <script type="text/template" id="viewTemplate">
            <div class="well well1" style="margin-top:20px;box-shadow:0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;">
                <h2 style="padding-left: 2.7cm;"><@= contact.get('name') @></h2>
                <div class="form-group" style="padding-left: 2.7cm;">
					 <label>name:&nbsp </label><font face=""><@= contact.get('name') @></font>
                    <label>number:&nbsp </label><font face=""><@= contact.get('number') @></font>
                </div>
                <div class="form-group" style="padding-left: 2.7cm;">
                    <label>mail:</label>
                    <p>
                        <@=  contact.get('mail') @>
                        
                    </p>
                </div>
                <a href="#" class="btn btn-large btn-default" style="font-size:20px;">close</i></a>
            </div>
        </script>
        
        <!-- the index container -->
        <script type="text/template" id="indexTemplate">
            <div class="fresh-table" width="100%">
                <table class="table table-striped" id="fresh-table" width="100%">
                    <thead class="fresh-table">
                            <th data-field="name" data-sortable="true">Name</th>
							<th data-field="number" data-sortable="true">Phone Number</th>
							<th data-field="name" data-sortable="true">Email</th>
                             <th data-field="actions" data-sortable="true">  Action</th>
                        </thead>
                    <tbody>
                        <@ _.each(contacts,function(entry){ @>
                        <tr class="Search">
                            <td><@= entry.get('name') @></td>
                            <td><@= entry.get('number') @></td>
                                <td> <@=  entry.get('mail') @></td>
                            

                            <td>
                            <a data-toggle="tooltip" data-placement="top" name="Tooltip on top" href="#/Details/<@= entry.id @>" style="font-size:20px;padding:0px;color:#229954;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></i></a>
                            <a href="#/edit/<@= entry.id @>" style="font-size:20px;padding:0px;color:#922B21"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                            <a href="#/remove/<@= entry.id @>" style="font-size:20px;padding:0px;color:#922B21"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                        </tr>
                        <@ }); @>
                    </tbody>
    
                </table>
            </div>
                       


        </script>
         <script type="text/jst" id="Profile">
            <div class="well" style="margin-top:10px;box-shadow:0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;" div="scroll">
                <h5>your profile</h5>
				<@ _.each(users,function(entry){ @>
								<div class="content">
									<div class="input-group">
								
											<i class="material-icons">face</i>
								
								<@= entry.get('name') @>
									</div>

									<div class="input-group">
										<i class="material-icons">mail</i>
										<@= entry.get('email') @>
												
									</div>
								</div>
					<@ }); @>
            </div>
        </script>



        <!-- load the libraries we need -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/json2/20150503/json2.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.2.3/backbone-min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/ct-navbar.js"></script>
        <script src="assets/js/index.js"></script>
            <script src="assets/nanobar/nanobar.js"></script>
            <script>
            
            </script>
        <script>
        _.templateSettings = {
                interpolate: /\<\@\=(.+?)\@\>/gim,
                evaluate: /\<\@([\s\S]+?)\@\>/gim,
                escape: /\<\@\-(.+?)\@\>/gim
            };

            var simplebar = new Nanobar();
            simplebar.go(100);
        </script>
    </body>

</html>