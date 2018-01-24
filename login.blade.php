<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Takoradi Polytechnic">
    <meta name="author" content="Takoradi Polytechnic">
    <title>E-school | Welcome</title>
    <meta name="msapplication-TileColor" content="#9f00a7">
    
  <!-- Favicons-->
  <link rel="icon" href="assets/favicon.png" sizes="32x32">
  <!-- Favicons-->
  <link rel="apple-touch-icon-precomposed" href="assets/favicon.png">
  <!-- For iPhone -->
  <meta name="msapplication-TileColor" content="#00bcd4">
  <meta name="msapplication-TileImage" content="assets/favicon.png">
  <!-- For Windows Phone -->


  <!-- CORE CSS-->
  
  <link href='{!! url( "logins/css/materialize.css")  !!}' type="text/css" rel="stylesheet" media="screen,projection">
  <link href='{!! url( "logins/css/style.css")  !!}' type="text/css" rel="stylesheet" media="screen,projection">
    <!-- Custome CSS-->    
    <link href="logins/css/custom-style.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="logins/css/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="logins/css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="logins/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
  
</head>

<body class="blue-grey">
  <!-- Start Page Loading -->
  <div id="loader-wrapper">
      <div id="loader"></div>        
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->
  <div>
   <!-- if there are login errors, show them here -->
		 @if (count($errors) > 0)

                <div class="uk-form-row">
                    <div class="alert alert-danger" style="background-color: red;color: white">
                       
                          <ul>
                            @foreach ($errors->all() as $error)
                              <li> {!!  $error  !!} </li>
                            @endforeach
                      </ul>
                </div>
              </div>
            @endif
  </div>
  <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
        <form class="login-form"  method="POST"  action="{{ url('login') }}">
             {!! csrf_field() !!}
        <div class="row">
          <div class="input-field col s12 center">
              <img src="logins/images/logo.png" alt="" class="" style="width:90px;height:100px">
            <p class="center login-form-text">E-School Manager</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input id="username" type="email" required="" name="email">
            <label for="username" class="center-align">Username</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input id="password" type="password" required="" name="password">
            <label for="password">Password</label>
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember-me" />
              <label for="remember-me">Remember me</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
              <table>
                  <tr>
                      <Td><button type="submit" class="btn waves-effect waves-light col s12">Login</button></Td>
                      <td><button type="submit" class="btn waves-effect waves-effect col s12">  Learn about SRMS</button></td>
                  </tr>
              </table>
          </div>
        </div>
        <div class="row">
            <center><small style="font-size: 11px">&copy <?php echo  date('Y'); ?> | gadeksystems.com</small></center>         
        </div>

      </form>
    </div>
  </div>



  <!-- ================================================
    Scripts
    ================================================ -->

  <!-- jQuery Library -->
  <script type="text/javascript" src="logins/js/jquery-1.11.2.min.js"></script>
  <!--materialize js-->
  <script type="text/javascript" src="logins/js/materialize.js"></script>
  <!--prism-->
  <script type="text/javascript" src="logins/js/prism.js"></script>
  <!--scrollbar-->
  <script type="text/javascript" src="logins/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

  <!--plugins.js - Some Specific JS codes for Plugin Settings-->
  <script type="text/javascript" src="logins/js/plugins.js"></script>

</body>
</html>
        