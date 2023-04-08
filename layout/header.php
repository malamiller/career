<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta http-equiv="Cache-control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>Carrier Search Inc</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/main.css">
    <link rel="stylesheet" href="public/css/main.css">


</head>
<body>

<?php
if(isset($_SESSION['c_user_name'])){$user = $_SESSION['c_user_name'];}else{$user = null;}; ?>
    <nav class="navbar navbar-default navbar-fixed-top" id="mnav">
        <div class="container-fluid">
        <div class="navbar-header">

            <!-- Collapsed Hamburger -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- Branding Image -->
            <a class="navbar-brand" id="" href="index.php">
                CSI <i class="fa fa-globe"></i>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="app-navbar-collapse">
            <!-- Left Side Of Navbar -->
            <ul class="nav navbar-nav" navbar-left>
                <li><a href="index.php" id=""><i class="fa fa-home" ></i> Landing </a></li>
            </ul>

            <!-- Right Side Of Navbar -->
            <ul class="nav navbar-nav navbar-right">
                <!-- dropdown Links -->

                <li>
                    <a href="aboutus.php" id=""><i class="fa fa-question-circle"></i> About Us </a>
                </li>
                <li>
                    <a href="companyprofile.php" id=""><i class="fa fa-group"></i> Company Profiles </a>
                </li>
                <li>
                    <a href="walkin.php" id=""><i class="fa fa-calendar"></i> Walk-in </a>
                </li>
                <li>
                    <a href="topjobs.php" id=""><i class="fa fa-list"></i> Available Jobs </a>
                </li>
                <li>
                    <a href="search.php" id=""><i class="fa fa-search"></i> Find Jobs </a>
                </li>

                <?php

                    if($user !== null){ // if the user is active show dropdown with user name.
                        ?>

                            <li class="dropdown" id="mydrop">
                                <a href="#" class="dropdown-toggle "  data-toggle="dropdown" role="button" aria-expanded="false">
                                    <?php echo ucfirst($user); ?><i class="caret"></i>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="<?php if($user_data['acc_type']==1){echo 'dashboard.php';}elseif($user_data['acc_type']==2){echo 'com_dashboard.php';} ?>">Dashboard <i class="fa fa-dashboard"></i>
                                        </a>
                                    </li>
<!--                                    <li>-->
<!--                                        <a href="setting">Settings <i class="fa fa-gears"></i>-->
<!--                                        </a>-->
<!--                                    </li>-->
                                    <li>

                                        <form id="logout" style="display: none;" method="post" action="functions/logout.php">
                                            <input type="hidden" name="logout">
                                        </form>

                                        <a href="#" onclick="event.preventDefault(); $('#logout').submit(); ">Logout <i class="fa fa-power-off"></i>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        <?php
                    } else{ ?>
                        <li ><a href="javascript:void(0);" id="lgbtn" data-toggle="modal" data-target="#myModal">Login
                                <i class="fa fa-sign-in"></i></a>
                        </li>
                    <?php }

                ?>

            </ul>
        </div>
        </div>
    </nav>

    <div id="myModal" class="modal fade " role="dialog">
        <div class="modal-dialog">

            <!-- Modal content -->
            <div class="modal-content orangebg" id="postmodal">

                <ul class="nav nav-tabs" style="position: relative">
                    <br>
                    <li class="active col-xs-6">
                        <a class="whitetxt"  data-toggle="tab" href="#userlg">
                            <div class="">

                                <h5 class="modal-title "><i class="fa fa-user-circle"></i> User Login<span ></span></h5>
                            </div>
                        </a>
                    </li>
                    <li class="col-xs-6">
                        <a class="whitetxt" data-toggle="tab" href="#companylg">
                            <div class="">

                                <h5 class="modal-title"><i class="fa fa-building"></i> Company Login<span ></span></h5>
                            </div>
                        </a>
                    </li>
                    <button id="modal-closure" type="button" class="close" data-dismiss="modal" style="position:absolute; right: 5px;top: 5px">&times;</button>
                </ul>

                <div class="tab-content" style="background-color: #fff">
                    <div id="userlg" class="tab-pane fade in active">
                        <div class="modal-body">
                            <h4 id="lgmsg" style="display: none"></h4>

                            <form role="form" action="functions/logincontrol.php" method="post">
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="email" id="email" type="email" class="form-control" required placeholder="email-id" autofocus>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" id="password" type="password" class="form-control" required placeholder="password">
                                </div>
                                <div class="modal-footer">
                                    <div class="col-xs-8" style="text-align: left">
                                        <a class="btn btn-xs btn-primary" style="margin-right: 10px" href="signup.php">Sign Up</a>
                                        <a class="btn btn-xs btn-primary" style="margin-right: 10px" href="resetpassword.php">Forgot Password?</a>
                                    </div>
                                    <div class="col-xs-4">
                                        <!-- removed from btn below : data-dismiss="modal"-->
                                        <button type="submit" name="login" class="btn btn-default btn-sm" >Login</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="companylg" class="tab-pane fade">
                        <div class="modal-body">
                            <h4 id="lgmsg" style="display: none"></h4>

                            <form role="form" action="functions/logincontrol.php" method="post">
                                <div class="form-group">
                                    <label for="email">Company Email</label>
                                    <input name="email" type="email" class="form-control" required placeholder="email-id" autofocus>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control" required placeholder="password">
                                </div>
                                <div class="modal-footer">
                                    <div class="col-xs-8" style="text-align: left">
                                        <a class="btn btn-xs btn-primary" style="margin-right: 10px" href="signup.php">Sign Up</a>
                                        <a class="btn btn-xs btn-primary" style="margin-right: 10px" href="resetpassword.php">Forgot Password?</a>
                                    </div>
                                    <div class="col-xs-4">
                                        <!-- removed from btn below : data-dismiss="modal"-->
                                        <button type="submit" name="clogin" class="btn btn-default btn-sm" >Login</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>



            </div>

        </div>
    </div>

    <div class="modalbg" id="mbox">
        <div class="imgmodal">
            <div class="wrapper text-center">
                <center>
                    <span class="close" onclick="closembox()">&times;</span>
                    <div class="wrapper">
                        <span class="simple"> Drag Mouse Over Arear to Crop</span>
                        <div id="theparent">
                            <img id="cropbox" onload="tryCrop()">
                        </div>
                    </div>
                    <form action="functions/crop.php" method="post" onsubmit="return checkCoords();">
                        <input type="hidden" id="x" name="x" />
                        <input type="hidden" id="y" name="y" />
                        <input type="hidden" id="w" name="w" />
                        <input type="hidden" id="h" name="h" />
                        <input type="hidden" id="imgurl" name="imgurl"/>
                        <input type="submit" value="Save Crop" />
                    </form>
                </center>

            </div>
        </div>
    </div>

<div class="mbody">
    <div class="container-fluid">
        <div class="container">


            <?php if(isset($_COOKIE['success'])){$msgshow = 'block';}else{$msgshow = 'none';}; ?>
            <div style="width: 100%;display: <?php echo $msgshow; ?> ;" >

                <div class="alert alert-success text-center ">
                    <b><?php echo $_COOKIE['success'] ?> </b>
                </div>

            </div>
            <?php if(isset($_COOKIE['error'])){$msgshow = 'block';}else{$msgshow = 'none';}; ?>
            <div style="display: <?php echo $msgshow; ?> ;" >

                <div class="alert alert-danger text-center ">
                    <b><?php echo $_COOKIE['error'] ?> </b>
                </div>
                <br>
            </div>

            <?php if(isset($_COOKIE['missing_field'])){$msgshow = 'block';}else{$msgshow = 'none';}; ?>
            <div style="width: 100%;display: <?php echo $msgshow; ?> ;" >

                <div class="alert alert-danger text-center">
                    <b><?php echo $_COOKIE['missing_field'] ?> </b>
                </div>
                <br>
            </div>

            <?php
            if(isset($_COOKIE['useraccount'])){$toshow = $_COOKIE['useraccount'];}else{$toshow = 'none';}; ?>
            <div style="width: 100%;display: <?php echo $toshow; ?> ;" >

                <div class="alert-info text-center alert-styled">
                    <b>Wrong Email or Password given!</b>
                </div>
                <br>
            </div>


            <?php

                if(isset($_SESSION['c_user_id'])){ ?>

                    <img style="height: 150px;width: 100%;" src="public/assets/chartss.gif" alt="">
                    <h3 class="text-center" style="color: #fff;font-size: 40px;margin-top: -100px;"> Advertisments
                        <h4 class="text-center" style="color: #fff;;">Search Jobs, Create Jobs, Empower Your World!</h4>
                    </h3>

             <?php   }else if(isset($_SESSION['com_user_id'])){  ?>


             <?php  }else{  ?>

                    <img style="height: 150px;width: 100%;" src="public/assets/chartss.gif" alt="">
                    <h3 class="text-center" style="color: #fff;font-size: 40px;margin-top: -100px;"> Advertisments
                        <h4 class="text-center" style="color: #fff;;">Search Jobs, Create Jobs, Empower Your World!</h4>
                    </h3>

             <?php   }
            ?>

        </div>
    </div>
    <br>
    <div class="container clearfix">


