<?php $this->load->view('header')?>

<div class="container" style="padding-top: 100px; padding-bottom: 100px;">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">ZONA RESTRITA</h5>
            <form method="POST" class="form-signin" action="<?php echo base_url('Login/logar')?>">
              <div class="form-label-group">
                <input type="text" id="inputLogin" name="login" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputLogin">Usuário</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" name="senha" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Senha</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Lembrar Senha</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Logar</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <?php $this->load->view('footer')?>